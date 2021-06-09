import 'package:tinkoff_invest/tinkoff_invest.dart';

import 'package:advanced_tinkoff_invest/models/extensions/MarketInstrumentExtension.dart';

extension MarketInstrumentListExtension on MarketInstrumentList {
  Map<String, dynamic> toJson() {
    Map<String, dynamic> _marketInstrumentListJson = {
      'total': '${this.total}',
      'instruments': this.instruments.map((instr) => instr.toJson()).toList(),
    };

    return _marketInstrumentListJson;
  }
}