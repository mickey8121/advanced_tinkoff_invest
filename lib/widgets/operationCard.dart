import 'package:advanced_tinkoff_invest/utils/translate.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:advanced_tinkoff_invest/models/extensions/StringExtension.dart';
import 'package:advanced_tinkoff_invest/utils/currencySymbols.dart';
import 'package:advanced_tinkoff_invest/utils/instrumentIcons.dart';

class OperationCard extends StatelessWidget {
  OperationCard({ Key? key, required this.operation }) : super(key: key);

  final Map operation;

  @override
  Widget build(BuildContext context) {
    final typeName = translateOperationType(operation['operationType'] ?? '');
    final instrumentType = '${operation['instrumentType']}'.splitPascalCase().capitalize();
    final currencySymbol = currencySymbols[operation['currency']];
    final payment = operation['payment'];
    final instrument = operation['instrument'];
    final instrumentName = instrument?['name'];
    final icon = instrumentIcons[instrumentType];

    String operationDate = (
      operation['date'] != null
      ? DateFormat('yMMMMd', 'en_US').format(DateTime.parse(operation['date']))
      : ''
    );

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            // dense: true,
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(icon, size: 30),
                Text(
                  instrument['ticker'],
                  style: TextStyle(
                    color: Colors.cyan[200],
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            title: Text(
              instrumentName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text(typeName),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${payment > 0 ? '+' : ''}$payment',
                  style: TextStyle(
                    fontSize: 16,
                    color: (
                      payment.isNegative
                        ? Colors.red[300]
                        : payment != 0
                          ? Colors.lightGreen[300]
                          : null
                    ),
                  ),
                ),
                Text(
                  currencySymbol != null ? ' $currencySymbol' : '',
                  style: TextStyle(fontSize: 16,)
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 0, bottom: 10, left: 16, right: 16),
            child: Text(
              operationDate,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white38,
              ),
            ),
          ),
        ],
      )
    );
  }
}