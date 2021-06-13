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

    final activePosition = instrument['activePosition'];

    double totalIncome =
      (value as List).fold(0.0, (double prev, o) => prev + (o?['payment'] ?? 0));

    if (activePosition?['currentPrice'] != null && activePosition['lots'] != null) {
      final costOfActivePosition = activePosition['currentPrice'] * activePosition['lots'];
      totalIncome += costOfActivePosition;
    }

    return MapEntry(key, { 'instrument': instrument, 'operations': value, 'totalIncome': totalIncome });
  }).values.toList();

  return groupedOperationsList;
}
