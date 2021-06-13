import 'package:advanced_tinkoff_invest/widgets/incomeCard.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

import 'package:advanced_tinkoff_invest/utils/calculateIncomes.dart';
// import 'package:advanced_tinkoff_invest/utils/currencySymbols.dart';
// import 'package:advanced_tinkoff_invest/models/api.dart';

class UserIncomes extends StatefulWidget {
  final List operations;
  UserIncomes({ Key? key, required this.operations }) : super(key: key);

  @override
  _UserIncomesState createState() => _UserIncomesState(operations);
}

class _UserIncomesState extends State<UserIncomes> {
  _UserIncomesState(this._operations);

  List? _incomesList;
  List _operations;

  @override
  void initState() {
    super.initState();
    
    final calculatedIncomes = calculateIncomes(_operations);

    setState(() {
      _incomesList = calculatedIncomes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      itemCount: _incomesList?.length ?? 0,
      itemBuilder: (context, index) => IncomeCard(incomeData: _incomesList?[index]),
    );
  }
}