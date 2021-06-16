import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

import 'package:advanced_tinkoff_invest/models/api.dart';

import 'package:advanced_tinkoff_invest/widgets/instrumentCard.dart';
import 'package:advanced_tinkoff_invest/widgets/tabItem.dart';

const List tabs = [
  {
    'label': 'Акции',
    'instrumentType': 'stock',
    'icon': Icons.bar_chart_rounded,
  },
  {
    'label': 'Облигации',
    'instrumentType': 'bond',
    'icon': Icons.featured_play_list_rounded,
  },
  {
    'label': 'Фонды',
    'instrumentType': 'etf',
    'icon': Icons.pie_chart_rounded,
  },
];

class InstrumentsScreen extends StatefulWidget {
  @override
  IinstrumentsScreenState createState() => IinstrumentsScreenState();
}

class IinstrumentsScreenState extends State<InstrumentsScreen> with TickerProviderStateMixin {
  TabController? _controller;
  bool _loading = true;
  String _currentInstrumentType = tabs[0]['instrumentType'];
  Map<String, List?> _instrumentLists = {
    'stock': null,
    'bond': null,
    'etf': null,
  };

  @override
  void initState() {
    super.initState();

    _controller = TabController(vsync: this, length: tabs.length);
    _controller!.addListener(_handleTabSelect);

    _loadingCurrentInstruments();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  Future<void> _loadingCurrentInstruments() async {
    if (_instrumentLists[_currentInstrumentType] == null) {
      if (!_loading) setState(() => _loading = true);

      final currentInstrumentList =
        await context.read<API>().getInstrumentsList(_currentInstrumentType);

      setState(() {
        _loading = false;
        _instrumentLists = {
          ..._instrumentLists,
          _currentInstrumentType: currentInstrumentList!['instruments']
        };
      });
    }
  }

  _handleTabSelect() {
    final int index = _controller!.index;
    final currentTab = tabs[index];

    setState(
      () {
        // _currentTabIndex = index;
        _currentInstrumentType = currentTab['instrumentType'];
      }
    );

    _loadingCurrentInstruments();
  }

  Widget _tabView(String instrumentType) {
    final List? currentList = _instrumentLists['$instrumentType'];

    return (
      _loading
        ? Center(child: Text('Loading'))
        : ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          itemCount: currentList?.length ?? 0,
          itemBuilder: (context, index) => InstrumentCard(instrumentData: currentList![index]),
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
          tabs: tabs.map((t) => tabItem(t['label'], t['icon'])).toList(),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        dragStartBehavior: DragStartBehavior.down,
        children: tabs.map((t) => _tabView(t['instrumentType'])).toList(),
      ),
    );
  }
}