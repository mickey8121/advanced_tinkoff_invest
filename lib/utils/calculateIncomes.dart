import 'package:collection/collection.dart';

List calculateIncomes(List operations) {
  final Map groupedOperationsMap =
    groupBy(
      // remove operations without figi, e.g. tax, payOut, commission
      operations.where((o) => o['figi'] != null).toList(),
      (o) => (o as Map)['figi'],
    );

  final List groupedOperationsList = groupedOperationsMap.map((key, value) {
    final instrument = value[0]['instrument'];

    if (instrument == null)
      return MapEntry(key, { 'instrument': instrument, 'operations': value, 'totalIncome': 0 });

    final activePosition = instrument['activePosition'];

    double income =
      (value as List).fold(0.0, (double prev, o) => prev + (o?['payment'] ?? 0));

    value.forEach((el) => print(el));

    final fullValue = {
      'instrument': instrument,
      'operations': value,
      'income': income,
      'totalIncome': income,
    };

    if (activePosition?['currentPrice'] != null && activePosition['lots'] != null) {
      final costOfActivePosition = activePosition['currentPrice'] * activePosition['lots'];
      fullValue['totalIncome'] += costOfActivePosition;
    }

    return MapEntry(key, fullValue);
  }).values.toList();

  return groupedOperationsList;
}
