import 'package:advanced_tinkoff_invest/widgets/operationCard.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Container(
         child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            children: _operations?.map((o) => OperationCard(operation: o)).toList() ?? [],
          )
        )
    );
  }
}