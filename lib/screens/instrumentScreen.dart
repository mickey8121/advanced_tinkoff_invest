// test trading_chart
import 'dart:convert';
import 'dart:math';

import 'package:advanced_tinkoff_invest/utils/getDurationByInterval.dart';
import 'package:http/http.dart' as http; // temporary
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tinkoff_invest/tinkoff_invest.dart';
import 'package:trading_chart/depth_chart.dart';
import 'package:trading_chart/entity/depth_entity.dart';
import 'package:trading_chart/entity/k_line_entity.dart';
import 'package:trading_chart/k_chart_widget.dart';
import 'package:trading_chart/utils/data_util.dart';
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
  late  List<Candle> _candles;
  List<KLineEntity>? _kLines = [];
  List<DepthEntity> _bids = [], _asks = [];

  @override
  void initState() {
    super.initState();
    _initData();
  }

  // @override
  // void dispose() async {
  //   super.dispose();
  //   if (_unsubscribe != null) await _unsubscribe!();
  // }

  void _initData() async {
    // final yfin = YahooFin();

    // final figi = widget.instrument?['figi'];
    // final ticker = widget.instrument?['ticker'];

    await _loadAsksAndBids();
    await _loadCandles(_selectedInterval);

    setState(() {
      _loading = false;
    });
  }

  Future<void> _loadAsksAndBids() async {
    try {
      final orderbook = await context.read<API>().getOrderbook(widget.instrument?['figi'], 20);
      final asks = orderbook.asks
        .map((ask) => DepthEntity(ask.price, ask.quantity.toDouble()))
        .toList();
      final bids = orderbook.bids
        .map((bid) => DepthEntity(bid.price, bid.quantity.toDouble()))
        .toList();
      
      bids.sort((elA, elB) => (elB.vol - elA.vol).toInt());
      asks.sort((elA, elB) => (elA.vol - elB.vol).toInt());

      setState(() { _bids = bids; _asks = asks; });
    } catch (e) {
      print('_loadOrderbook $e');
    }
  }

  Future<void> _loadCandles(CandleResolution interval) async {
    final duration = durationByInterval(interval);

    final nowDate = DateTime.now();
    final fromDate = nowDate.subtract(duration);

    setState(() => _loading = true);

    Candles candles = await context.read<API>().getCandles(
      figi: widget.instrument?['figi'],
      from: fromDate,
      to: nowDate,
      interval: interval,
    );

    List<KLineEntity> kLines = candles.candles.map(
      (candle) {
        return KLineEntity.fromCustom(
          amount: Random().nextInt(300).toDouble(),
          ratio: 0.5,
          change: 1,
          open: candle.o,
          close: candle.c,
          high: candle.h,
          low: candle.l,
          vol: candle.v.toDouble(),
          time: candle.time.millisecondsSinceEpoch,
        );
      }
    ).toList();

    DataUtil.calculate(kLines);

    setState(() { _loading = false; _candles = candles.candles; _kLines = kLines; });
  }

  void _onTap(interval) {
    if (_selectedInterval == interval) return;

    setState(() => _selectedInterval = interval);
    _loadCandles(interval);
  }

  @override
  Widget build(BuildContext context) {
    final viewHeight = (
      MediaQuery.of(context).size.height
      - AppBar().preferredSize.height
      - MediaQuery.of(context).padding.top
      // - 50 // margin from the bottom edge
    );

    return Container(
       child: Scaffold(
          appBar: AppBar(title: Text(widget.instrument?['name'])),
          body: ListView(
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                height: viewHeight,
                alignment: Alignment.center,
                child: _loading ? CircularProgressIndicator() : Stack(children: <Widget>[
                  Container(
                    height: viewHeight - 50 - 60,
                    width: double.infinity,
                    child: KChartWidget(
                      _kLines,
                      isLine: false,
                      mainState: MainState.BOLL,
                      secondaryState: SecondaryState.WR,
                      fixedLength: 2,
                      timeFormat: TimeFormat.YEAR_MONTH_DAY,
                      maDayList: [5,10,20],
                      bgColor: [Colors.black, Colors.black],
                      isChinese: false,
                      // onLoadMore: (bool a) {},
                      // isOnDrag: (isDrag){},
                    ),
                  ),

                  Positioned(
                    bottom: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
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
                  ),
                ]),
              ),

              // Container(
              //   height: 250,
              //   alignment: Alignment.center,
              //   width: double.infinity,
              //   color: Colors.black,
              //   child: (
              //     _loading
              //       ? CircularProgressIndicator()
              //       : DepthChart(_bids, _asks)
              //   ),
              // ),
            ]),
          ],
        ),
       ),
    );
  }
}