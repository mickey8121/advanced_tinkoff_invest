import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tinkoff_invest/tinkoff_invest.dart';

import 'package:advanced_tinkoff_invest/models/extensions/StringExtension.dart';

import 'package:advanced_tinkoff_invest/utils/currencySymbols.dart';
import 'package:advanced_tinkoff_invest/models/api.dart';

class UserOperations extends StatefulWidget {
  @override
  _UserOperationsState createState() => _UserOperationsState();
}

class _UserOperationsState extends State<UserOperations> {
  bool _loading = true;
  List? _operations;

  @override
  void initState() {
    super.initState();

    setState(() => _loading = false);
    _loadData();
  }

  Future<void> _loadData() async {
    Map<String, dynamic>? operations = await context.read<API>().getAllOperations();

    final operationsList = operations?['operations'];

    setState(() {
      _loading = false;
      _operations = operationsList;
    });
  }

  Widget _operationCard(Map operation) {
    final type = '${operation['operationType']}'.splitPascalCase().capitalize();
    final instrumentType = '${operation['instrumentType']}'.splitPascalCase().capitalize();
    final currencySymbol = currencySymbols[operation['currency']];
    final payment = operation['payment'];
    final figi = operation['figi'];
    final trades = operation['trades'];
    final title = '$type ';
    final instrument = operation['instrument'];

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          instrument?['name'] ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                        ),
                      ],
                    ),
                    Text(type),
                    SizedBox(height: 5),
                    Text('$instrumentType'),
                    SizedBox(height: 5),
                    Text(operationDate),
                    SizedBox(height: 5),
                    Text('$figi'),
                  ],
                ),
                Text(
                  paymentData,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: payment.isNegative ? Colors.red[700] : Colors.green[700],
                  ),
                ),
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
       child: (
         _loading
          ? Center(child: Text('Loading', style: Theme.of(context).textTheme.headline3))
          : Container(
            child: ListView(
              children: _operations != null ? _operations!.map((o) => _operationCard(o)).toList() : [],
            )
          )
       ),
    );
  }
}