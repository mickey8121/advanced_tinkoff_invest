import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:advanced_tinkoff_invest/models/api.dart';

import 'package:tinkoff_invest/tinkoff_invest.dart';

import 'package:advanced_tinkoff_invest/screens/bondsScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = true;
  Portfolio? _portfolio;
  UserAccounts? _userAccounts;
  // List<Order>? _tinkoffOrders;

  @override
  void initState() {
    super.initState();

    initData();
  }

  void initData() async {
    _portfolio = await context.read<Api>().getPortfolio();
    _userAccounts = await context.read<Api>().getAccounts();

    // final String tinkoffAccountId = _userAccounts?.accounts.where(
    //   (acc) => acc.brokerAccountType.name == 'tinkoff'
    // ).toList()[0].brokerAccountId as String;

    // _tinkoffOrders = await context.read<Api>().getOrders(tinkoffAccountId);

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
            // Accounts
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

            // Positions
            SizedBox(height: 50),
            Text('Positions', style: Theme.of(context).textTheme.headline5),
            SizedBox(height: 10),
            ..._portfolio?.positions.map(
              (item) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.name),
                  Text('${item.ticker}'),
                  Text('${item.balance}'),
                  Text('${item.lots}'),
                ],
              )
            ).toList() ?? [],
            SizedBox(height: 50),
            Center(
              child: TextButton(
                onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BondsScreen())),
                child: Text('Bonds'),
              ),
            )
          ],
        )
      ),
    );


    // return Scaffold(
    //   body: _loading ? Center(child: Text('Loading', style: Theme.of(context).textTheme.headline3)) : ListView(
    //     // physics: ,
    //     padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
    //     children: _allBonds?.instruments.map(
    //       (instr) => Container(
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(10),
    //           color: Colors.white,
    //           boxShadow: [
    //             BoxShadow(color: Colors.black26, spreadRadius: 1),
    //           ],
    //         ),
    //         // minHeight: 60,
    //         padding: EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 10),
    //         margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
    //         child: Row(
    //           children: [
    //             Expanded(
    //               flex: 4,
    //               child: Container(
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   crossAxisAlignment: CrossAxisAlignment.stretch,
    //                   children: [
    //                     SizedBox(height: 11),
    //                     Row(
    //                       children: [
    //                         Text(
    //                           instr.ticker,
    //                           style: TextStyle(fontWeight: FontWeight.bold),
    //                         ),
    //                       ],
    //                     ),
    //                     Row(
    //                       children: [
    //                         Text(
    //                           instr.type.name.toUpperCase(),
    //                           style: TextStyle(
    //                             fontSize: 10,
    //                             color: Colors.red[300],
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             Expanded(
    //               flex: 8,
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     instr.name,
    //                     style: TextStyle(
    //                       fontSize: 16,
    //                       color: Colors.blue[600],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         )
    //       )
    //     ).toList() ?? [],
    //   )
    // );
  }
}
