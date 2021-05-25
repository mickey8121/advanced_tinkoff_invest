import 'package:flutter/widgets.dart';
import 'package:tinkoff_invest/tinkoff_invest.dart';

class Api extends ChangeNotifier {
  var _api;

  TinkoffInvestApi get tinkoffApi => _api;

  void setInitApi(token, [sandboxMode = false, debug = false]) {
    _api = TinkoffInvestApi(token, sandboxMode: sandboxMode, debug: debug);

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
      else if (entity.asError.error.payload?.message != null)
        throw entity.asError.error.payload.message;
    }

    throw 'Error';
  }

  Future<Portfolio> getPortfolio() async {
    final portfolio = await tinkoffApi.portfolio.load();
    return _responseHandling(portfolio);
  }
  
  Future<UserAccounts> getAccounts() async {
    final accounts = await tinkoffApi.user.accounts();
    return _responseHandling(accounts);
  }
  
  Future<List<Order>> getOrders(String brokerAccountId) async {
    final orders = await tinkoffApi.orders.load(brokerAccountId);
    return _responseHandling(orders);
  }
  
  Future<MarketInstrumentList> getAllBonds() async {
    final bonds = await tinkoffApi.market.bonds();
    return _responseHandling(bonds);
  }

  Future<Candles> getCandles({
    required String figi,
    required DateTime from,
    required DateTime to,
    required CandleResolution interval,
  }) async {
    final candles = await tinkoffApi.market.candles(figi, from, to, interval);
    return _responseHandling(candles);
  }
}
