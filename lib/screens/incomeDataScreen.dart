import 'package:advanced_tinkoff_invest/widgets/operationCard.dart';
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
    final activePosition = _incomeData['instrument']?['activePosition'];
    final List operations = _incomeData['operations'] ?? [];

    if (activePosition != null) {
      activePosition['instrument'] = _incomeData['instrument'];
      activePosition['operationType'] = 'В портфеле (${activePosition['lots']})';
      activePosition['payment'] = activePosition['lots'] * activePosition['currentPrice'];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Доход c ${_incomeData['instrument']['ticker']}')
      ),
      body: (
        operations.length == 0
          ? Text('Операции не найдены')
          : ListView(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            children: [
              if (activePosition != null) OperationCard(operation: activePosition),
              ...operations.map((o) => OperationCard(operation: o)).toList(),
            ],
          )
      ),
    );
  }
}