import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:advanced_tinkoff_invest/models/api.dart';

import 'package:advanced_tinkoff_invest/routes/conditionalRouter.dart';
// import 'package:advanced_tinkoff_invest/routes/mainRouter.dart';
// import 'package:advanced_tinkoff_invest/screens/loginScreen.dart';
// import 'package:advanced_tinkoff_invest/screens/homeScreen.dart';
// import 'package:advanced_tinkoff_invest/screens/bondsScreen.dart';
// import 'package:advanced_tinkoff_invest/screens/instrumentScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Api>(
        create: (context) => Api(),
        child: MaterialApp(
          title: 'Provider Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          // theme: ThemeData(
          //   primaryColor: Colors.black,
          //   accentColor: Colors.blueAccent,
          //   visualDensity: VisualDensity.adaptivePlatformDensity,
          // ),
          home: ConditionalRouter(),
          // home: MainRouter(),
          // initialRoute: '/login',
          // routes: {
          //   '/login': (context) => LoginScreen(),
          //   '/home': (context) => HomeScreen(),
          //   '/bonds': (context) => BondsScreen(),
          //   '/instrument': (context) => InstrumentScreen(bondFigi: null),
          // },
        ),
    );
  }
}
