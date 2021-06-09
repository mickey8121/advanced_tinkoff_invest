import 'package:tinkoff_invest/tinkoff_invest.dart';

extension OperationTradeExtension on OperationTrade {
  Map<String, dynamic> toJson() => {
    'tradeId': this.tradeId,
    'date': this.date.toIso8601String(),
    'price': this.price,
    'quantity': this.quantity,
  };
}