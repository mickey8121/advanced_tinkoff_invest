import 'package:tinkoff_invest/tinkoff_invest.dart';

extension MarketInstrumentExtension on MarketInstrument {
  Map<String, dynamic> toJson() {
    Map<String, dynamic> marketInstrumentJson = {
      'figi': '${this.figi}',
      'ticker': '${this.ticker}',
      'isin': '${this.isin}',
      'name': '${this.name}',
      'currency': '${this.currency!.name}',
      'type': '${this.type.name}',
      'minPriceIncrement': this.minPriceIncrement,
      'faceValue': this.faceValue,
      'lot': this.lot,
      'minQuantity': this.minQuantity,
    };

    return marketInstrumentJson;
  }
}