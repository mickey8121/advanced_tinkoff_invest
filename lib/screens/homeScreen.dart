import 'package:advanced_tinkoff_invest/widgets/positionCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinkoff_invest/tinkoff_invest.dart';

import 'package:advanced_tinkoff_invest/models/api.dart';

final snackBar = SnackBar(
  content: Container(
    child: Text('Cache cleared!', textAlign: TextAlign.center),
  )
);

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = true;
  Map? _portfolio;
  UserAccounts? _userAccounts;
  // List<Order>? _tinkoffOrders;

  @override
  void initState() {
    super.initState();

    initData();
  }

  void initData() async {
    // final yfin = YahooFin();

    // StockInfo info = yfin.getStockInfo(ticker: 'AAPL');
    
    // var price = await yfin.getPrice(stockInfo: info);
    // var priceChange = await yfin.getPriceChange(stockInfo: info);
    // var volume = await yfin.getVolume(stockInfo: info);

    // print(price);
    // print(priceChange);
    // print(volume);

    _portfolio = await context.read<API>().getPortfolio();
    _userAccounts = await context.read<API>().getAccounts();

    // final String tinkoffAccountId = _userAccounts?.accounts.where(
    //   (acc) => acc.brokerAccountType.name == 'tinkoff'
    // ).toList()[0].brokerAccountId as String;

    // _tinkoffOrders = await context.read<API>().getOrders(tinkoffAccountId);

    setState(() { _loading = false; });
  }

  _clearCache() {
    final prefs = context.read<API>().localStorage.prefs;
    final token = prefs.getString('userToken');
    
    prefs.clear();

    if (token != null) prefs.setString('userToken', token);

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: (
          _loading
            ? Center(child: Text('Загрузка'))
            : ListView(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                children: ((_portfolio!['positions'] ?? []) as List).map(
                  (item) => PositionCard(position: item)
                ).toList(),
              )
        ),
            // Accounts
            // ...[
            //   Text('Accounts', style: Theme.of(context).textTheme.headline5),
            //   SizedBox(height: 10),
            //   ..._userAccounts?.accounts.map(
            //     (acc) => Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(acc.brokerAccountId),
            //         Text(acc.brokerAccountType.name),
            //       ],
            //     ),
            //   ).toList() ?? []
            // ],

            // // Positions
            // SizedBox(height: 50),
            // Text('Positions', style: Theme.of(context).textTheme.headline5),
            // SizedBox(height: 10),
            
            // ListView(
            //   children: ((_portfolio!['positions'] ?? []) as List).map(
            //     (item) => item != null ?  Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(item['name']),
            //         Text('${item['ticker']}'),
            //         Text('${item['balance']}'),
            //         Text('${item['lots']}'),
            //       ],
            //     ) : Text('Нет позиций')
            //   ).toList(),
            // ),

            // SizedBox(height: 50),
            // Center(
            //   child: TextButton(
            //     onPressed: _clearCache,
            //     child: Text('Clear cache'),
            //   ),
            // ),
            // SizedBox(height: 50),
            // Center(
            //   child: TextButton(
            //     onPressed: context.read<API>().logout,
            //     child: Text('Logout'),
            //   ),
            // ),
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
