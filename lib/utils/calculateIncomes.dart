import 'package:collection/collection.dart';

List calculateIncomes(List operations) {
  final Map groupedOperationsMap =
    groupBy(
      // remove operations without figi, e.g. tax, payOut, commission
      operations.where((o) => o['figi'] != null).toList(),
      (o) => (o as Map)['figi'],
    );

  final List groupedOperationsList = groupedOperationsMap.map((key, value) {
    return MapEntry(key, { 'instrument': value[0]['instrument'], 'operations': value, });
  }).values.toList();

  return groupedOperationsList;
}
