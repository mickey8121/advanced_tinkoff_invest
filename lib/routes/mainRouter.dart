import 'package:flutter/material.dart';


// import 'package:advanced_tinkoff_invest/screens/loginScreen.dart';
import 'package:advanced_tinkoff_invest/screens/homeScreen.dart';
import 'package:advanced_tinkoff_invest/screens/instrumentsScreen.dart';
// import 'package:advanced_tinkoff_invest/screens/bondsScreen.dart';
// import 'package:advanced_tinkoff_invest/screens/instrumentScreen.dart';

final List screens = [
  {
    'title': 'Home',
    'child': HomeScreen(),
    'barItem': BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
  },
  {
    'title': 'Instruments',
    'child': InstrumentsScreen(),
    'barItem': BottomNavigationBarItem(
      icon: Icon(Icons.list_alt_rounded),
      label: 'Instruments',
    ),
  },
  {
    'title': 'Profile',
    'child': HomeScreen(),
    'barItem': BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: 'Profile',
    ),
  },
];

class MainRouter extends StatefulWidget {
  // MainRouter({Key key}) : super(key: key);

  @override
  _MainRouterState createState() => _MainRouterState();
}

class _MainRouterState extends State<MainRouter> {
  final _items = screens.map((screen) => screen['barItem'] as BottomNavigationBarItem).toList();
  int _tabIndex = 0;
  
  void Function(int)? _onTapHandler(int index) {
    setState(() { _tabIndex = index; });
  }

  @override
  Widget build(BuildContext context) {
    final currentScreen = screens[_tabIndex];

    return Scaffold(
      appBar: AppBar(title: Text(currentScreen['title'])),
      body: currentScreen['child'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTapHandler,
        currentIndex: _tabIndex, // this will be set when a new tab is tapped
        items: _items,
      ),
    );
  }
}