import 'package:tinkoff_invest/tinkoff_invest.dart';

import 'package:advanced_tinkoff_invest/models/extensions/OperationExtension.dart';

extension OperationsExtension on Operations {
  Map<String, dynamic> toJson() => {
    'operations': this.operations.map((o) => o.toJson()).toList(),
  };
}