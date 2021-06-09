import 'package:tinkoff_invest/tinkoff_invest.dart';

import 'package:advanced_tinkoff_invest/models/extensions/OperationTradeExtension.dart';

extension OperationExtension on Operation {
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> operationJson = {
      'id': this.id,
      'figi': this.figi,
      'currency': this.currency.name,
      'payment': this.payment,
      'price': this.price,
      'commission': {
        'value': this.commission?.value,
        'currency': this.commission?.currency.name,
      },
      'operationType': this.operationType?.name,
      'quantity': this.quantity,
      'quantityExecuted': this.quantityExecuted,
      'isMarginCall': this.isMarginCall,
      'status': this.status.name,
      'instrumentType': this.instrumentType?.name,
      'trades': this.trades?.map((t) => t.toJson()).toList(),
      'date': this.date.toIso8601String(),
    };

    return operationJson;
  }
}