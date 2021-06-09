// import 'package:async/async.dart';
import 'package:async/async.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tinkoff_invest/tinkoff_invest.dart';

import 'package:advanced_tinkoff_invest/services/LocalStorage.dart';
import 'package:advanced_tinkoff_invest/utils/operationsHC.dart' as operationsHC;

import 'package:advanced_tinkoff_invest/models/extensions/PortfolioExtension.dart';
import 'package:advanced_tinkoff_invest/models/extensions/MarketInstrumentListExtension.dart';
import 'package:advanced_tinkoff_invest/models/extensions/OperationExtension.dart';
import 'package:advanced_tinkoff_invest/models/extensions/OperationsExtension.dart';

class API extends ChangeNotifier {
  API() {
    _initLocalStorage();
  }

  void _initLocalStorage() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    this.localStorage = LocalStorage(prefs: sharedPreferences);
  }

  TinkoffInvestApi? _api;
  bool isAuthorized = false;
  LocalStorage? localStorage;

  TinkoffInvestApi? get tinkoffApi => _api;

  void setInitApi(token, [sandboxMode = false, debug = false]) async {
    _api = TinkoffInvestApi(token, sandboxMode: sandboxMode, debug: debug);

    if (_api?.user != null) isAuthorized = true;

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
  Map<String, dynamic>? getDataFromLocalStorage(String key) => localStorage?.getData(key: key);
  void setDataToLocalStorage(String key, Map data) => localStorage?.setData(key: key, data: data);
  //

  Future<Map<String, dynamic>?> getPortfolio() async {
    // print((await tinkoffApi!.portfolio.load()).runtimeType != ErrorResult);
    var portfolio = getDataFromLocalStorage('portfolio');

    if (portfolio == null) {
      final portfolioLoad = await tinkoffApi?.portfolio.load();

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
    final accounts = await tinkoffApi?.user.accounts();
    return _responseHandling(accounts);
  }
  
  Future<List<Order>> getOrders(String brokerAccountId) async {
    final orders = await tinkoffApi?.orders.load(brokerAccountId);
    return _responseHandling(orders);
  }

  Future<Map<String, dynamic>?> getInstrumentsList(String instrumentType) async {
    final localStorageKey = '${instrumentType}List';
    
    var instrumentsList = getDataFromLocalStorage(localStorageKey);

    if (instrumentsList == null) {
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
        instrumentsList = (response as MarketInstrumentList).toJson();

        setDataToLocalStorage(localStorageKey, instrumentsList);
      } catch (e) {
        throw e;
      }
    }

    return instrumentsList;
  }
  
  Future<MarketInstrumentList> getStocks() async {
    final stocks = await tinkoffApi?.market.stocks();
    return _responseHandling(stocks);
  }

  Future<MarketInstrumentList> getBonds() async {
    final bonds = await tinkoffApi?.market.bonds();
    return _responseHandling(bonds);
  }

  Future<MarketInstrumentList> getEtfs() async {
    final etfs = await tinkoffApi?.market.etfs();
    return _responseHandling(etfs);
  }

  Future<MarketInstrumentList> getCurrencies() async {
    final currencies = await tinkoffApi?.market.currencies();
    return _responseHandling(currencies);
  }

  Future<Orderbook> getOrderbook(String figi, int depth) async {
    final orderbook = await tinkoffApi?.market.orderbook(figi, depth);
    return _responseHandling(orderbook);
  }

  Future<Map<String, dynamic>?> getAllOperations({ bool? noCache }) async {
    Map<String, dynamic>? operations = getDataFromLocalStorage('operations');

    if (operations == null) {
      // for real response ------------------------------------
      // final DateTime nowDate = DateTime.now();
      // final duration = Duration(days: 10000);
      // final from = nowDate.subtract(duration);
      // var operationsLoad = await tinkoffApi?.operations.load(from, nowDate);

      final instrumentsList = {
        'Stock': await getInstrumentsList('stock'),
        'Currency': await getInstrumentsList('currency'),
        'Bond': await getInstrumentsList('bond'),
        'Etf': await getInstrumentsList('etf'),
      };

      try {
        // var operationsResponse = _responseHandling(operationsLoad); // for real response
        var operationsResponse = { 'operations': operationsHC.operations };

        // for real response
        // var operationsList = List.from((operationsResponse as Operations).toJson()['operations'] ?? []);

        var extendedOperations =
          // await Future.wait(operationsList.map((o) async { // for real response
          await Future.wait(List.from(operationsResponse['operations'] ?? []).map((o) async {
            var operation = Map.from(o); // make mutable

            final figi = operation['figi'];
            final instrumentType = operation['instrumentType'];
            
            if (figi != null && instrumentType != null) {
              final instruments = instrumentsList['$instrumentType'];

              if (instruments?['instruments'] != null) {
                operation['instrument'] =
                  instruments?['instruments'].firstWhere((instr) => instr['figi'] == figi);
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
    final candles = await tinkoffApi?.market.candles(figi, from, to, interval);
    return _responseHandling(candles);
  }

  Future<SearchMarketInstrument> instrumentByTicker(String ticker) async {
    final instrument = await tinkoffApi?.market.searchByTicker(ticker);
    return _responseHandling(instrument);
  }

  Future<SearchMarketInstrument> instrumentByFigi(String figi) async {
    final instrument = await tinkoffApi?.market.searchByFigi(figi);
    return _responseHandling(instrument);
  }

  dynamic subscribeToInstrumentInfo(String figi) async {
    _api!.streaming.instrumentInfo.subscribe(
      figi,
      (event) => print('InstrumentInfo: ${event.payload}'),
    );
  }

  Future<Function> subscribeToCandle(String figi, StreamingCandleInterval interval, listener) async {
    _api?.streaming.candle.subscribe(figi, interval, listener);
    return () => _api?.streaming.candle.unsubscribe(figi, interval, listener);
  }

  Function subscribeToOrderbook(String figi, int depth, listener) {
    _api!.streaming.orderbook.subscribe(figi, 10, listener);
    return () => _api?.streaming.orderbook.unsubscribe(figi, depth, listener);
  }
}
