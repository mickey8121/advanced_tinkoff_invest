import 'package:flutter/material.dart';

import 'package:advanced_tinkoff_invest/widgets/userOperations.dart';

class ProfileScreen extends StatefulWidget {
  // ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: UserOperations(),
    );
  }
}