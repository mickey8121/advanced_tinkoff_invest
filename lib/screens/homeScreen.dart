import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:advanced_tinkoff_invest/models/api.dart';

import 'package:tinkoff_invest/tinkoff_invest.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = true;
  Portfolio? _portfolio;
  UserAccounts? _userAccounts;
  List<Order>? _tinkoffOrders;

  @override
  void initState() {
    super.initState();

    initData();
  }

  void initData() async {
    _portfolio = await context.read<Api>().getPortfolio();
    _userAccounts = await context.read<Api>().getAccounts();

    final String tinkoffAccountId = _userAccounts?.accounts.where(
      (acc) => acc.brokerAccountType.name == 'tinkoff'
    ).toList()[0].brokerAccountId as String;

    _tinkoffOrders = await context.read<Api>().getOrders(tinkoffAccountId);

    final allBounds = await context.read<Api>().getAllBounds();

    print(allBounds);

    setState(() { _loading = false; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        // child: Center(child: Text('Loading')),
        child: _loading ? Center(child: Text('Loading', style: Theme.of(context).textTheme.headline3)) : Column(
          children: [
            ...[
              Text('Accounts', style: Theme.of(context).textTheme.headline5),
              SizedBox(height: 10),
              ..._userAccounts?.accounts.map(
                (acc) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(acc.brokerAccountId),
                    Text(acc.brokerAccountType.name),
                  ],
                ),
              ).toList() ?? []
            ],
            SizedBox(height: 50),
            Text('Positions', style: Theme.of(context).textTheme.headline5),
            SizedBox(height: 10),
            ..._portfolio?.positions.map(
              (item) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${item.name}'),
                  // Text('${item.figi}'),
                  Text('${item.ticker}'),
                  Text('${item.balance}'),
                  Text('${item.lots}'),
                ],
              )
            ).toList() ?? [],
          ]
        )
      ),
    );
  }
}
