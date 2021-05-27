import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:advanced_tinkoff_invest/models/api.dart';

import 'package:advanced_tinkoff_invest/routes/mainRouter.dart';
import 'package:advanced_tinkoff_invest/screens/loginScreen.dart';

class ConditionalRouter extends StatefulWidget {
  // ConditionalRouter({Key key}) : super(key: key);

  @override
  _ConditionalRouterState createState() => _ConditionalRouterState();
}

class _ConditionalRouterState extends State<ConditionalRouter> {
  @override
  Widget build(BuildContext context) {
    final bool _isAuthorized = context.watch<Api>().isAuthorized;

    print(_isAuthorized);

    return Container(
       child: _isAuthorized ? MainRouter() : LoginScreen(),
    );
  }
}
