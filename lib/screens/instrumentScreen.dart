import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinkoff_invest/tinkoff_invest.dart';

import 'package:advanced_tinkoff_invest/models/api.dart';

class InstrumentScreen extends StatefulWidget {
  final String? bondFigi;
  InstrumentScreen({ Key? key, @required this.bondFigi }) : super(key: key);

  @override
  _InstrumentScreenState createState() => _InstrumentScreenState();
}

class _InstrumentScreenState extends State<InstrumentScreen> {
  bool _loading = true;
  SearchMarketInstrument? _instrument;
  StreamingCandle? _candle;
  Function? _unsubscribe;

  @override
  void initState() {
    super.initState();

    _initData();
  }

  @override
  void dispose() async {
    if (_unsubscribe != null) await _unsubscribe!();
    print('disposed');

    super.dispose();
  }

  void _initData() async {
    _instrument = await context.read<Api>().instrumentByFigi(widget.bondFigi as String);
    // Orderbook orderbook = await context.read<Api>().getOrderbook(widget.bondFigi as String, 10);

    await _subscribe();
    setState(() { _loading = false; });
  }

  Future<void> _subscribe() async {
    _unsubscribe = await context.read<Api>().subscribeToCandle(
      widget.bondFigi as String,
      StreamingCandleInterval.oneMin,
      (event) {
        _candle = event.payload;
        print(event);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(_candle);
    print(_unsubscribe);

    return Container(
       child: (
         _loading
          ? Center(child: Text('Loading', style: Theme.of(context).textTheme.headline3))
          : (
            _candle != null
              ? Scaffold(
                body: Center(
                  child: Column(
                    children: <Widget>[
                      Text('${'_candle'}'),
                    ]
                  ),
                ),
              )
            : Center(child: Text('Candle is not found...', style: Theme.of(context).textTheme.headline5))
          )
       ),
    );
  }
}