import 'package:tinkoff_invest/tinkoff_invest.dart';

extension PortfolioPositionExtension on PortfolioPosition {
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _portfolioPositionJson = {
      'figi': '${this.figi}',
      'ticker': '${this.ticker}',
      'isin': '${this.isin}',
      'instrumentType': '${this.instrumentType.name}',
      'balance': '${this.balance}',
      'blocked': '${this.blocked}',
      'expectedYield': {
        'value': '${this.expectedYield?.value}',
        'currency': '${this.expectedYield?.currency.name}',
      },
      'lots': '${this.lots}',
      'averagePositionPrice': {
        'value': '${this.averagePositionPrice?.value}',
        'currency': '${this.averagePositionPrice?.currency.name}',
      },
      'averagePositionPriceNoNkd': {
        'value': '${this.averagePositionPriceNoNkd?.value}',
        'currency': '${this.averagePositionPriceNoNkd?.currency.name}',
      },
      'name': '${this.name}',
    };

    return _portfolioPositionJson;
  }
}