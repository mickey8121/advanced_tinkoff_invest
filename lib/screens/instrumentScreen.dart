import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinkoff_invest/tinkoff_invest.dart';

import 'package:advanced_tinkoff_invest/models/api.dart';

import 'package:advanced_tinkoff_invest/widgets/candlesticksChart.dart';

const intervals = [
  { 'label': '1 minute', 'key': CandleResolution.oneMin },
  { 'label': '2 minutes', 'key': CandleResolution.twoMin },
  { 'label': '3 minutes', 'key': CandleResolution.threeMin },
  { 'label': '5 minutes', 'key': CandleResolution.fiveMin },
  { 'label': '10 minutes', 'key': CandleResolution.tenMin },
  { 'label': '15 minutes', 'key': CandleResolution.fifteenMin },
  { 'label': '30 minutes', 'key': CandleResolution.thirtyMin },
  { 'label': '1 hour', 'key': CandleResolution.hour },
  { 'label': '1 Day', 'key': CandleResolution.day },
  { 'label': 'Week', 'key': CandleResolution.week },
  { 'label': 'Month', 'key': CandleResolution.month },
];

class InstrumentScreen extends StatefulWidget {
  final MarketInstrument? instrument;
  InstrumentScreen({ Key? key, @required this.instrument }) : super(key: key);

  @override
  _InstrumentScreenState createState() => _InstrumentScreenState();
}

class _InstrumentScreenState extends State<InstrumentScreen> {
  bool _loading = true;
  CandleResolution _selectedInterval = CandleResolution.oneMin;
  Orderbook? _orderbook;
  List<Candle>? _candles;
  // Function? _unsubscribe;

  @override
  void initState() {
    super.initState();

    _initData();
  }

  // @override
  // void dispose() async {
  //   if (_unsubscribe != null) await _unsubscribe!();
  //   print('disposed');

  //   super.dispose();
  // }

  void _initData() async {
    // SearchMarketInstrument instrument =
    //   await context.read<Api>().instrumentByFigi(widget.bondFigi as String);
    Orderbook orderbook = await context.read<Api>().getOrderbook(widget.instrument?.figi as String, 10);

    // final nowDate = DateTime.now();
    // final fromDate = nowDate.subtract(const Duration(days: 30));

    // Candles candles = await context.read<Api>().getCandles(
    //   figi: widget.instrument?.figi as String,
    //   from: fromDate,
    //   to: nowDate,
    //   interval: CandleResolution.day,
    // );

    await _loadCandles();

    setState(() {
      _loading = false;
      _orderbook = orderbook;
      // _candles = candles.candles;
    });
  }

  Future<void> _loadCandles([CandleResolution? interval]) async {
    Duration duration = Duration(days: 1);

    if (interval != null)
    switch (interval) {
      case CandleResolution.hour:
        duration = Duration(days: 7);
        break;
      case CandleResolution.week:
      case CandleResolution.day:
        duration = Duration(days: 365);
        break;
      case CandleResolution.month:
        duration = Duration(days: 365 * 5);
        break;
      default:
        break;
    }

    final nowDate = DateTime.now();
    final fromDate = nowDate.subtract(duration);

    setState(() => _loading = true);

    Candles candles = await context.read<Api>().getCandles(
      figi: widget.instrument?.figi as String,
      from: fromDate,
      to: nowDate,
      interval: interval ?? CandleResolution.day,
    );

    setState(() { _loading = false; _candles = candles.candles; });
  }

  // Future<void> _subscribe() async {
  //   _unsubscribe = await context.read<Api>().subscribeToCandle(
  //     widget.bondFigi as String,
  //     StreamingCandleInterval.oneMin,
  //     (event) {
  //       _candle = event.payload;
  //       print(event);
  //     },
  //   );
  // }

  void _onTap(interval) {
    if (_selectedInterval == interval) return;

    setState(() => _selectedInterval = interval);
    _loadCandles(interval);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
          appBar: AppBar(title: Text(widget.instrument?.name as String)),
          body: Column(
            children: [
              CandlesticksChart(candles: _candles as List, isLoading: _loading),
              Container(
                color: Colors.black45,
                height: 60,
                padding: EdgeInsets.only(top: 10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 10),
                    Wrap(
                      spacing: 10,
                      children: intervals.map(
                        (el) => InkWell(
                          onTap: () => _onTap(el['key']),
                          child: Chip(
                            backgroundColor: _selectedInterval == el['key'] ? Colors.blueGrey : null,
                            label: Text(el['label'] as String)
                          ),
                        )
                      ).toList()
                    ),
                    SizedBox(width: 10),
                  ]
                ),
              ),
            ],
          ),
       ),
    );
  }
}