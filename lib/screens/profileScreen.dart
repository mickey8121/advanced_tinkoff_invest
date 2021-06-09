import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:advanced_tinkoff_invest/widgets/userIncome.dart';
import 'package:advanced_tinkoff_invest/widgets/userOperations.dart';

final List tabs = [
  {
    'label': 'Operations',
    'icon': Icons.history_rounded,
  },
  {
    'label': 'Income',
    'icon': Icons.money,
  },
];

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  Widget _tabItem(String label, IconData icon) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          SizedBox(width: 10),
          Text(label),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerDragStartBehavior: DragStartBehavior.down,
      appBar: AppBar(
        toolbarHeight: 15,
        bottom: TabBar(
          controller: _controller,
          indicatorWeight: 0.5,
          tabs: tabs.map((t) => _tabItem(t['label'], t['icon'])).toList(),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        dragStartBehavior: DragStartBehavior.down,
        children: [
           UserOperations(),
           UserIncome(),
        ],
      ),
    );
  }
}