import 'package:flutter/material.dart';

class IncomeDataScreen extends StatefulWidget {
  final Map incomeData;
  IncomeDataScreen({ Key? key, required this.incomeData }) : super(key: key);

  @override
  _IncomeDataScreenState createState() => _IncomeDataScreenState(incomeData);
}

class _IncomeDataScreenState extends State<IncomeDataScreen> {
  final _incomeData;
  _IncomeDataScreenState(this._incomeData);

  @override
  Widget build(BuildContext context) {
    print(_incomeData);

    return Container(
       child: Text('Test'),
    );
  }
}