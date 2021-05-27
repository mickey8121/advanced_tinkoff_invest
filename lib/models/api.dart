import 'package:flutter/widgets.dart';
import 'package:tinkoff_invest/tinkoff_invest.dart';

class Api extends ChangeNotifier {
  var _api;
  bool isAuthorized = false;

  TinkoffInvestApi? get tinkoffApi => _api;

  void setInitApi(token, [sandboxMode = false, debug = false]) {
    _api = TinkoffInvestApi(token, sandboxMode: sandboxMode, debug: debug);

    if (_api?.user != null) isAuthorized = true;

    notifyListeners();
  }

  dynamic _responseHandling(dynamic entity) {
    if (entity.isValue) {
      try {
        return entity.asValue!.value.payload;
      } catch (e) {
        throw e as String;
      }
    } else if (entity.isError && entity.asError != null) {
      if (entity.asError.error.runtimeType == String)
        throw entity.asError?.error;
      else if (entity.asError.error.payload?.message != null) {
        throw entity.asError.error.payload.message;
      }
    }

    throw 'Error';
  }

  Future<Portfolio> getPortfolio() async {
    final portfolio = await tinkoffApi?.portfolio.load();
    return _responseHandling(portfolio);
  }
  
  Future<UserAccounts> getAccounts() async {
    final accounts = await tinkoffApi?.user.accounts();
    return _responseHandling(accounts);
  }
  
  Future<List<Order>> getOrders(String brokerAccountId) async {
    final orders = await tinkoffApi?.orders.load(brokerAccountId);
    return _responseHandling(orders);
  }

  Future<MarketInstrumentList> getInstrumentsList(String instrumentType) async {
    var instrumentsList;

    switch (instrumentType) {
      case 'stock':
        instrumentsList = await tinkoffApi?.market.stocks();
        break;
      case 'bond':
        instrumentsList = await tinkoffApi?.market.bonds();
        break;
      case 'etf':
        instrumentsList = await tinkoffApi?.market.etfs();
        break;
      default:
        throw 'Error: instrumentType is incorrect';
    }

    return _responseHandling(instrumentsList);
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

  Future<Orderbook> getOrderbook(String figi, int depth) async {
    final orderbook = await tinkoffApi?.market.orderbook(figi, depth);
    return _responseHandling(orderbook);
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
    _api.streaming.instrumentInfo.subscribe(
      figi,
      (event) => print('InstrumentInfo: ${event.payload}'),
    );
  }

  Future<Function> subscribeToCandle(String figi, StreamingCandleInterval interval, Function cb) async {
    await _api.streaming.candle.subscribe(figi, interval, cb);
    return () async => await _api.streaming.candle.unsubscribe(figi, interval, cb);
  }
}
