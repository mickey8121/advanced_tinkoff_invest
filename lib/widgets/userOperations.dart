import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:advanced_tinkoff_invest/models/extensions/StringExtension.dart';
import 'package:advanced_tinkoff_invest/utils/currencySymbols.dart';

const instrumentIcons = {
  'Stock': Icons.bar_chart_rounded,
  'Bond': Icons.featured_play_list_rounded,
  'Etf': Icons.pie_chart_rounded,
  'Currency': Icons.money,
};

class UserOperations extends StatefulWidget {
  final List operations;
  UserOperations({ Key? key, required this.operations }) : super(key: key);

  @override
  _UserOperationsState createState() => _UserOperationsState(operations);
}

class _UserOperationsState extends State<UserOperations> {
  _UserOperationsState(this._operations);

  List? _operations;

  @override
  void initState() {
    super.initState();
  }

  Widget _operationCard(Map operation) {
    final type = '${operation['operationType']}'.splitPascalCase().capitalize();
    final instrumentType = '${operation['instrumentType']}'.splitPascalCase().capitalize();
    final currencySymbol = currencySymbols[operation['currency']];
    final payment = operation['payment'];
    // final figi = operation['figi'];
    // final trades = operation['trades'];
    // final title = '$type ';
    final instrument = operation['instrument'];
    final instrumentName = instrument?['name'];
    final icon = instrumentIcons[instrumentType];

    final paymentData = '$payment$currencySymbol';
    String operationDate = DateFormat('yMMMMd', 'en_US').format(DateTime.parse(operation['date']));
    
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.only(top: 15, bottom: 10, left: 16, right: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            instrumentName != null ? instrumentName : type,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                          ),
                          ...(icon != null ? [Icon(icon)] : []),
                        ],
                      ),

                      SizedBox(height: 2),
                      Text(instrumentName != null ? type : ''),
                      SizedBox(height: 5),
                      SizedBox(height: 5),
                      Text(operationDate),
                    ],
                  ),
                ),

                Text(
                  paymentData,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: payment.isNegative ? Colors.red[700] : Colors.green[700],
                  ),
                  textAlign: TextAlign.end,
                ),
                // Expanded(
                //   flex: 3,
                //   child: Text(
                //     paymentData,
                //     style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 18,
                //       color: payment.isNegative ? Colors.red[700] : Colors.green[700],
                //     ),
                //     textAlign: TextAlign.end,
                //   ),
                // ),
              ],
            )
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Container(
         child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            children: _operations?.map((o) => _operationCard(o)).toList() ?? [],
          )
        )
    );
  }
}