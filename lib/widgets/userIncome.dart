import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:advanced_tinkoff_invest/utils/calculateIncomes.dart';
import 'package:advanced_tinkoff_invest/utils/currencySymbols.dart';
import 'package:advanced_tinkoff_invest/models/api.dart';

class UserIncome extends StatefulWidget {
  UserIncome({ Key? key }) : super(key: key);

  @override
  UuserIncomeState createState() => UuserIncomeState();
}

class UuserIncomeState extends State<UserIncome> {
  bool _loading = true;
  List? _incomesList;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    Map<String, dynamic>? operations = await context.read<API>().getAllOperations();

    final operationsList = operations?['operations'];

    final calculatedIncomes = calculateIncomes(operationsList);

    setState(() {
      _loading = false;
      _incomesList = calculatedIncomes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
         children: _incomesList?.map((income) => Text(income['instrument']['name'])).toList() ?? [],
       ),
    );
  }
}