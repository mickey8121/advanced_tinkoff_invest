import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';

import 'package:advanced_tinkoff_invest/models/api.dart';

import 'package:advanced_tinkoff_invest/widgets/userIncomes.dart';
import 'package:advanced_tinkoff_invest/widgets/userOperations.dart';

final List tabs = [
  {
    'label': 'Операции',
    'icon': Icons.history_rounded,
  },
  {
    'label': 'Доход',
    'icon': Icons.money,
  },
];

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
  TabController? _controller;
  List? _operationsList;
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    _controller = TabController(vsync: this, length: tabs.length);
    _loadData();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    // Map<String, dynamic>? operations = await context.read<API>().getAllOperations();
    await context.read<API>().getAllOperations()
      .then((val) => setState(() => _operationsList = val?['operations']))
      .catchError((err) => print(err));

    setState(() {
      _loading = false;
      // _operationsList = operationsList;
    });
  }

  Widget _tabItem(String label, IconData icon) {
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Icon(icon), Text(label)],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerDragStartBehavior: DragStartBehavior.down,
      appBar: AppBar(
        toolbarHeight: 10,
        bottom: TabBar(
          controller: _controller,
          indicatorWeight: 0.5,
          tabs: tabs.map((t) => _tabItem(t['label'], t['icon'])).toList(),
        ),
      ),
      body: (
        _loading
          ? Center(child: Text('Loading', style: Theme.of(context).textTheme.headline3))
          : _operationsList != null ? TabBarView(
              controller: _controller,
              dragStartBehavior: DragStartBehavior.down,
              children: [
                UserOperations(operations: _operationsList as List),
                UserIncomes(operations: _operationsList as List),
              ],
            ) : null
      )
    );
  }
}