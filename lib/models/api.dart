import 'package:async/async.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tinkoff_invest/tinkoff_invest.dart';
import 'package:yahoofin/yahoofin.dart';

import 'package:advanced_tinkoff_invest/services/LocalStorage.dart';
import 'package:advanced_tinkoff_invest/utils/operationsHC.dart' as operationsHC;

import 'package:advanced_tinkoff_invest/models/extensions/PortfolioExtension.dart';
import 'package:advanced_tinkoff_invest/models/extensions/MarketInstrumentListExtension.dart';
// import 'package:advanced_tinkoff_invest/models/extensions/OperationExtension.dart';
import 'package:advanced_tinkoff_invest/models/extensions/OperationsExtension.dart';

class API extends ChangeNotifier {
  API() {
    _initLocalStorage();
    _initYahooFinApi();
  }

  void _initLocalStorage() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    this.localStorage = LocalStorage(prefs: sharedPreferences);

    final savedToken = localStorage.prefs.getString('userToken');

    if (savedToken != null) {
      login(savedToken, true);
    }
  }

  void _initYahooFinApi() {
    _yahooFinApi = YahooFin();
  }

  late YahooFin _yahooFinApi;
  late TinkoffInvestApi _api;
  late LocalStorage localStorage;
  bool isAuthorized = false;

  TinkoffInvestApi get tinkoffApi => _api;
  YahooFin? get yahooFinApi => _yahooFinApi;

  TinkoffInvestApi _initTinkoffAPI(token, [sandboxMode = false, debug = false])
    => TinkoffInvestApi(token, sandboxMode: sandboxMode, debug: debug);

  Future<void> login(token, [saveToken = false, sandboxMode = false, debug = false]) async {
    TinkoffInvestApi tinkoffInvestApi = _initTinkoffAPI(token, sandboxMode, debug);

    final portfolio = await tinkoffInvestApi.portfolio.load();

    if (portfolio is ValueResult) {
      if (saveToken) localStorage.prefs.setString('userToken', token);

      _api = tinkoffInvestApi;
      isAuthorized = true;
    } else throw 'Ошибка Авторизации';

    notifyListeners();
  }

  void logout() {
    localStorage.prefs.remove('userToken');
    isAuthorized = false;

    notifyListeners();
  }

  dynamic _responseHandling(dynamic entity) {
    if (entity is ValueResult) {
      if (entity.isValue) {
        try {
          return entity.asValue.value.payload;
        } catch (e) {
          throw e as String;
        }
      } else if (entity.isError && entity.asError != null) {
        if (entity.asError?.error.runtimeType == String)
          throw entity.asError!.error;
        // else if (entity.asError?.error.payload.message != null)
        //   throw entity.asError.error.payload.message;
      }
    } else return entity;

    throw 'Error';
  }

  // LocalStorage methods
  Map<String, dynamic>? getDataFromLocalStorage(String key) => localStorage.getData(key: key);
  void setDataToLocalStorage(String key, Map data) => localStorage.setData(key: key, data: data);
  //

  Future<Map<String, dynamic>?> getPortfolio({ bool noCache = false }) async {
    // print((await tinkoffApi!.portfolio.load()).runtimeType != ErrorResult);
    var portfolio = noCache ? null : getDataFromLocalStorage('portfolio');

    if (portfolio == null) {
      final portfolioLoad = await tinkoffApi.portfolio.load();

      try {
        final portfolioResponse = _responseHandling(portfolioLoad);
        portfolio = (portfolioResponse as Portfolio).toJson();
        
        setDataToLocalStorage('portfolio', portfolio);
      } catch (e) {
        throw e;
      }
    }

    return portfolio;
  }
  
  Future<UserAccounts> getAccounts() async {
    final accounts = await tinkoffApi.user.accounts();
    return _responseHandling(accounts);
  }
  
  Future<List<Order>> getOrders(String brokerAccountId) async {
    final orders = await tinkoffApi.orders.load(brokerAccountId);
    return _responseHandling(orders);
  }

  Future<Map<String, dynamic>?> getInstrumentsList(
    String instrumentType,
    { bool noCache = false }
  ) async {
    final localStorageKey = '${instrumentType}List';
    
    var instruments = noCache ? null : getDataFromLocalStorage(localStorageKey);

    if (instruments == null) {
      var instrumentResponse;

      switch (instrumentType) {
        case 'stock':
          instrumentResponse = await getStocks();
          break;
        case 'bond':
          instrumentResponse = await getBonds();
          break;
        case 'etf':
          instrumentResponse = await getEtfs();
          break;
        case 'currency':
          instrumentResponse = await getCurrencies();
          break;
        default:
          throw 'Error: instrumentType is incorrect';
      }

      try {
        final response = _responseHandling(instrumentResponse);
        final portfolio = await getPortfolio(noCache: noCache);
        final positions = portfolio?['positions'];
        
        instruments = (response as MarketInstrumentList).toJson();

        var instrumentsList = Future.wait(List.from(instruments['instruments']).map((instr) async {
          final activePosition = (
            positions != null
              ? (positions as List).firstWhere(
                (p) => p['figi'] == instr['figi'],
                orElse: () => null
              )
              : null
          );

          if (activePosition != null) instr['activePosition'] = activePosition;

          return instr;
        }).toList());

        instruments['instruments'] =  await instrumentsList;

        setDataToLocalStorage(localStorageKey, instruments);
      } catch (e) {
        throw e;
      }
    }

    return instruments;
  }
  
  Future<MarketInstrumentList> getStocks() async {
    final stocks = await tinkoffApi.market.stocks();
    return _responseHandling(stocks);
  }

  Future<MarketInstrumentList> getBonds() async {
    final bonds = await tinkoffApi.market.bonds();
    return _responseHandling(bonds);
  }

  Future<MarketInstrumentList> getEtfs() async {
    final etfs = await tinkoffApi.market.etfs();
    return _responseHandling(etfs);
  }

  Future<MarketInstrumentList> getCurrencies() async {
    final currencies = await tinkoffApi.market.currencies();
    return _responseHandling(currencies);
  }

  Future<Orderbook> getOrderbook(String figi, int depth) async {
    final orderbook = await tinkoffApi.market.orderbook(figi, depth);
    return _responseHandling(orderbook);
  }

  // TODO enable cache
  Future<Map<String, dynamic>?> getAllOperations({ bool noCache = true }) async {
    Map<String, dynamic>? operations = noCache ? null : getDataFromLocalStorage('operations');

    if (operations == null) {
      final tinkoffInvestFoundationDate = DateTime(2016);
      final nowDate = DateTime.now();

      var operationsLoad =
        await tinkoffApi.operations.load(tinkoffInvestFoundationDate, nowDate);

      final instrumentsList = {
        'stock': await getInstrumentsList('stock'),
        'currency': await getInstrumentsList('currency'),
        'bond': await getInstrumentsList('bond'),
        'etf': await getInstrumentsList('etf'),
      };

      try {
        var operationsResponse = _responseHandling(operationsLoad);
        var operationsList = List.from((operationsResponse as Operations).toJson()['operations'] ?? []);

        final extendedOperations =
          await Future.wait(operationsList.map((o) async {
            var operation = Map.from(o); // make mutable

            final figi = operation['figi'];
            final instrumentType = operation['instrumentType'].toLowerCase();
            
            if (figi != null && instrumentType != null) {
              final instruments = instrumentsList['$instrumentType'];

              if (instruments?['instruments'] != null) {
                final instrument = instruments?['instruments'].firstWhere((instr) => instr['figi'] == figi);

                if (instrument['activePosition'] != null) {
                  final currentPrice = await stockCurrentPrice(instrument['ticker']);
                  instrument['activePosition']['currentPrice'] = currentPrice;
                }

                operation['instrument'] = instrument;
              }
            }

            return operation;
          }).toList());

        operations = { 'operations': extendedOperations };

        setDataToLocalStorage('operations', operations);
      } catch (e) {
        throw e;
      }
    }

    return operations;
  }

  /* 
    Candle interval and max allowable request interval
    1min [1 minute, 1 day]
    2min [2 minutes, 1 day]
    3min [3 minutes, 1 day]
    5min [5 minutes, 1 day]
    10min [10 minutes, 1 day]
    15min [15 minutes, 1 day]
    30min [30 minutes, 1 day]
    hour [1 hour, 7 days]
    day [1 day, 1 year]
    week [7 days, 2 years]
    month [1 month, 10 years]
  */
  Future<Candles> getCandles({
    required String figi,
    required DateTime from,
    required DateTime to,
    required CandleResolution interval,
  }) async {
    final candles = await tinkoffApi.market.candles(figi, from, to, interval);
    return _responseHandling(candles);
  }

  Future<SearchMarketInstrument> instrumentByTicker(String ticker) async {
    final instrument = await tinkoffApi.market.searchByTicker(ticker);
    return _responseHandling(instrument);
  }

  Future<SearchMarketInstrument> instrumentByFigi(String figi) async {
    final instrument = await tinkoffApi.market.searchByFigi(figi);
    return _responseHandling(instrument);
  }

  Future<Function> subscribeToInstrumentInfo(String figi, listener) async {
    _api.streaming.instrumentInfo.subscribe(figi, listener);

    return () => _api.streaming.instrumentInfo.unsubscribe(figi, listener);
  }

  Future<Function> subscribeToCandle(String figi, StreamingCandleInterval interval, listener) async {
    _api.streaming.candle.subscribe(figi, interval, listener);
    return () => _api.streaming.candle.unsubscribe(figi, interval, listener);
  }

  Function subscribeToOrderbook(String figi, int depth, listener) {
    _api.streaming.orderbook.subscribe(figi, 10, listener);
    return () => _api.streaming.orderbook.unsubscribe(figi, depth, listener);
  }

  // YahooFin
  // ----------------------------------------------------------------
  // ----------------------------------------------------------------
  // ----------------------------------------------------------------

  // Future<dynamic> stockData(String ticker, { bool noCache = false }) async {
  //   final localStorageKey = '${ticker}StockData';
    
  //   var stockData = noCache ? null : getDataFromLocalStorage(localStorageKey);

  //   if (stockData == null) {
  //     try {
  //       final StockInfo instrumentInfoYFin = _yahooFinApi.getStockInfo(ticker: ticker);
  //       final instrData = await instrumentInfoYFin.getStockData();

  //       // stockData = instrData;
  //     } catch (e) {}
  //   }
  // }

  Future<double?> stockCurrentPrice(String ticker, { bool noCache = false }) async {
    const exchangeIDs = {
      'DE': 'DE',
      'GS': 'IL',
      'US': '',
    };

    final splitedTicker = ticker.split(new RegExp('\@'));
    final tickerName = splitedTicker[0];
    final exchangePrefix = splitedTicker.length > 1 ? exchangeIDs[splitedTicker[1]] : null;

    final fullTickerName = '$tickerName${exchangePrefix != null ? '.$exchangePrefix' : ''}';

    final localStorageKey = '${fullTickerName}StockCurrentPrice';
    final localStorageKeyAlt = '$tickerName.MEStockCurrentPrice';

    var stockData = (
      noCache
        ? null
        : (
          getDataFromLocalStorage(localStorageKey)
          ?? getDataFromLocalStorage(localStorageKeyAlt)
        )
    );

    if (stockData == null) {
      try {
        final StockInfo instrumentInfoYFin = _yahooFinApi.getStockInfo(ticker: fullTickerName);
        final instrData = await instrumentInfoYFin.getStockData();

        stockData = { 'currentPrice': instrData.currentPrice };
        setDataToLocalStorage(localStorageKey, stockData);
      } catch (e) {
        // alt ticker
        if ((e as dynamic)?.statusCode == 404) {
          try {
            final StockInfo instrumentInfoYFin = _yahooFinApi.getStockInfo(ticker: '$tickerName.ME');
            final instrData = await instrumentInfoYFin.getStockData();

            stockData = { 'currentPrice': instrData.currentPrice };
            setDataToLocalStorage(localStorageKeyAlt, stockData);
          } catch (e) {
            // this is crutch
            print('Error: $e. Setting up currentPrice of $tickerName as 0.0');
            stockData = { 'currentPrice': 0.0 };
            setDataToLocalStorage(localStorageKeyAlt, stockData);
          }
        }
      }
    }

    return stockData?['currentPrice'];
  }
}
