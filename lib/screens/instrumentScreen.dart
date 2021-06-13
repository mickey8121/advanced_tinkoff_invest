import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinkoff_invest/tinkoff_invest.dart';
import 'package:yahoofin/yahoofin.dart';
// ignore: implementation_imports
import 'package:yahoofin/src/models/stockQuote.dart';

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
  final Map? instrument;
  InstrumentScreen({ Key? key, @required this.instrument }) : super(key: key);

  @override
  _InstrumentScreenState createState() => _InstrumentScreenState();
}

class _InstrumentScreenState extends State<InstrumentScreen> {
  bool _loading = true;
  CandleResolution _selectedInterval = CandleResolution.oneMin;
  Map<String, dynamic>? _orderbookData;
  // Orderbook? _orderbook;
  List<Candle>? _candles;
  StockQuote? _instrumentData;
  Function? _unsubscribe;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose() async {
    super.dispose();
    if (_unsubscribe != null) await _unsubscribe!();
  }

  void _initData() async {
    final yfin = YahooFin();

    final figi = widget.instrument?['figi'];
    final ticker = widget.instrument?['ticker'];

    StockInfo instrumentInfo = yfin.getStockInfo(ticker: ticker);

    try {
      _instrumentData = await instrumentInfo.getStockData();
    } catch (e) {
      print(e);
    }

    await _loadCandles(_selectedInterval);

    final unsubscribe = context.read<API>().subscribeToOrderbook(
      figi,
      10,
      (data) => setState(
        () {
          _orderbookData = {
            'event': data.event,
            'time': data.time,
            'payload': data.payload,
          };
        }
      ),
    );

    setState(() {
      _loading = false;
      _unsubscribe = unsubscribe;
    });
  }

  Future<void> _loadCandles(CandleResolution interval) async {
    Duration duration = Duration(days: 1);

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

    Candles candles = await context.read<API>().getCandles(
      figi: widget.instrument?['figi'],
      from: fromDate,
      to: nowDate,
      interval: interval,
    );

    setState(() { _loading = false; _candles = candles.candles; });
  }

  void _onTap(interval) {
    if (_selectedInterval == interval) return;

    setState(() => _selectedInterval = interval);
    _loadCandles(interval);
  }

  @override
  Widget build(BuildContext context) {
    final double? currentPrice = _instrumentData?.currentPrice;
    final double? fiftyDaysAverageChange = _instrumentData?.fiftyDayAverageChange;

    final String? regularMarketChange =
      _instrumentData?.regularMarketChangePercent?.toStringAsFixed(3);

    return Container(
       child: Scaffold(
          appBar: AppBar(title: Text(widget.instrument?['name'])),
          body: Column(
            children: [
              CandlesticksChart(candles: _candles as List, isLoading: _loading),
              Container(
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
              _loading ? Text('Loading') : Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Current Price:'),
                        SizedBox(width: 20,),
                        Text(currentPrice != null ? '$currentPrice\$' : 'unknown'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Regular Market Change:'),
                        SizedBox(width: 20,),
                        Text(regularMarketChange != null ? '$regularMarketChange%' : 'unknown'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('50 Days Average Change:'),
                        SizedBox(width: 20,),
                        Text(fiftyDaysAverageChange != null ? '$fiftyDaysAverageChange\$' : 'unknown'),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: _orderbookData != null ? [
                        // Text('${_orderbookData!['time']}'),
                        Flexible(
                          child: Text('${_orderbookData!['payload']}'),
                        ),
                      ] : [],
                    )
                  ],
                ),
              )
            ],
          ),
       ),
    );
  }
}