import 'package:advanced_tinkoff_invest/utils/translate.dart';
import 'package:flutter/material.dart';

import 'package:advanced_tinkoff_invest/models/extensions/StringExtension.dart';
// import 'package:advanced_tinkoff_invest/utils/currencySymbols.dart';
import 'package:advanced_tinkoff_invest/utils/instrumentIcons.dart';

class PositionCard extends StatefulWidget {
  PositionCard({ Key? key, required this.position }) : super(key: key);
  final Map position;

  @override
  _PositionCardState createState() => _PositionCardState(position);
}

class _PositionCardState extends State<PositionCard> {
  _PositionCardState(this.position);
  final Map position;

  @override
  Widget build(BuildContext context) {
    final name = position['name'];
    final instrumentType = '${position['instrumentType']}'.splitPascalCase().capitalize();
    final instrumentTypeRus = translateInstrumentType(instrumentType);
    final balance = position['balance'].toStringAsFixed(2);
    final icon = instrumentIcons[instrumentType];
    // final currencySymbol = currencySymbols[position['currency']];

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(icon, size: 30),
                Text(
                  instrumentType == 'Currency' ? '' : position['ticker'],
                  style: TextStyle(
                    color: Colors.cyan[200],
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            title: Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text(instrumentTypeRus),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$balance',
                  style: TextStyle(fontSize: 16),
                ),
                // Text(
                //   currencySymbol != null ? ' $currencySymbol' : '',
                //   style: TextStyle(fontSize: 16,)
                // ),
              ],
            ),
          ),
        ],
      )
    );
  }
}