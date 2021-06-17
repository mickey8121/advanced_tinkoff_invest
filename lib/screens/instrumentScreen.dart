import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:tinkoff_invest/tinkoff_invest.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:trading_chart/depth_chart.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:trading_chart/entity/depth_entity.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:trading_chart/entity/k_line_entity.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:trading_chart/k_chart_widget.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:trading_chart/utils/data_util.dart';
// ignore: implementation_imports
import 'package:yahoofin/src/models/stockQuote.dart';
import 'package:yahoofin/yahoofin.dart';

import 'package:advanced_tinkoff_invest/models/api.dart';
import 'package:advanced_tinkoff_invest/utils/durationByInterval.dart';

import 'package:advanced_tinkoff_invest/widgets/tabItem.dart';

const List tabs = [
  {
    'label': 'График',
    'name': 'chart',
    'icon': Icons.insights,
  },
  {
    'label': 'Стакан',
    'name': 'orderbook',
    'icon': Icons.stacked_bar_chart,
  },
  {
    'label': 'Данные',
    'name': 'desc',
    'icon': Icons.description,
  },
];

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

// const intervals = [
//   { 'label': '1 minute', 'key': StreamingCandleInterval.oneMin },
//   { 'label': '2 minutes', 'key': StreamingCandleInterval.twoMin },
//   { 'label': '3 minutes', 'key': StreamingCandleInterval.threeMin },
//   { 'label': '5 minutes', 'key': StreamingCandleInterval.fiveMin },
//   { 'label': '10 minutes', 'key': StreamingCandleInterval.tenMin },
//   { 'label': '15 minutes', 'key': StreamingCandleInterval.fifteenMin },
//   { 'label': '30 minutes', 'key': StreamingCandleInterval.thirtyMin },
//   { 'label': '1 hour', 'key': StreamingCandleInterval.hour },
//   { 'label': '1 Day', 'key': StreamingCandleInterval.day },
//   { 'label': 'Week', 'key': StreamingCandleInterval.week },
//   { 'label': 'Month', 'key': StreamingCandleInterval.month },
// ];

 List<KLineEntity> candlesToKLines(List<dynamic> candles) =>
  candles.map(
    (candle) {
      return KLineEntity.fromCustom(
        amount: Random().nextInt(300).toDouble(),
        open: candle.o,
        close: candle.c,
        high: candle.h,
        low: candle.l,
        vol: candle.v.toDouble(),
        time: candle.time.millisecondsSinceEpoch,
      );
    }
  ).toList();

class InstrumentScreen extends StatefulWidget {
  final Map? instrument;
  InstrumentScreen({ Key? key, @required this.instrument }) : super(key: key);

  @override
  _InstrumentScreenState createState() => _InstrumentScreenState();
}

class _InstrumentScreenState extends State<InstrumentScreen> with TickerProviderStateMixin {
  TabController? _controller;
  CandleResolution _selectedInterval = CandleResolution.oneMin;
  List<KLineEntity>? _kLines = [];
  List<DepthEntity> _bids = [], _asks = [];
  StockQuote? _stockData;
  bool _loading = true;

  double get viewHeight => (
    MediaQuery.of(context).size.height
    - AppBar().preferredSize.height
    - MediaQuery.of(context).padding.top
    - 47
  );

  @override
  void initState() {
    super.initState();

    _controller = TabController(vsync: this, length: tabs.length);    
    _initData();
  }

  @override
  void dispose() async {
    super.dispose();
    _controller!.dispose();
  }

  void _initData() async {
    await _loadInfo();
    await _loadAsksAndBids();
    await _loadCandles(_selectedInterval);

    setState(() {
      _loading = false;
    });
  }

  Future<void> _loadInfo() async {
    final yfin = YahooFin();
    final ticker = widget.instrument?['ticker'];

    StockInfo instrumentInfo = yfin.getStockInfo(ticker: ticker);

    try {
      StockQuote stockData = await instrumentInfo.getStockData();
      setState(() { _stockData = stockData; });
    } catch (e) {
      print(e);
    }
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
    // final intervalAsCandleResolution = CandleResolution.values.firstWhere(
    //   (val) => val.name == interval.name,
    //   orElse: () => CandleResolution.oneMin,
    // );

    final nowDate = DateTime.now();
    final fromDate = nowDate.subtract(duration);

    setState(() => _loading = true);

    Candles candles = await context.read<API>().getCandles(
      figi: widget.instrument?['figi'],
      from: fromDate,
      to: nowDate,
      interval: interval,
    );

    // void candleSubscriptionListener(data) {
    //   final StreamingCandle candle = data.payload;
    //   List<KLineEntity> newKLines = candlesToKLines([candle]);

    //   setState(() {
    //     _kLines = [..._kLines ?? [], ...newKLines];
    //   });
    // }

    // if (_unsubscribeToCandle != null) await _unsubscribeToCandle!();
    // final unsubscribeToCandle = await context.read<API>().subscribeToCandle(
    //   figi: widget.instrument?['figi'],
    //   interval: interval,
    //   listener: candleSubscriptionListener,
    // );

    List<KLineEntity> kLines = candlesToKLines(candles.candles);
    DataUtil.calculate(kLines);

    setState(() {
      _loading = false;
      _kLines = kLines;
    });
  }

  void _onTap(interval) {
    if (_selectedInterval == interval) return;

    setState(() => _selectedInterval = interval);
    _loadCandles(interval);
  }

  Widget renderChart() {
    return (
      Stack(children: <Widget>[
        Container(
          height: viewHeight,
          child: Stack(children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: viewHeight - 200,
              width: double.infinity,
              child: _loading ? CircularProgressIndicator() : KChartWidget(
                _kLines,
                isLine: false,
                mainState: MainState.BOLL,
                secondaryState: SecondaryState.WR,
                fixedLength: 2,
                timeFormat: TimeFormat.YEAR_MONTH_DAY,
                maDayList: [5,10,20],
                bgColor: [Colors.black, Colors.black],
                isChinese: false,
              ),
            ),

            Positioned(
              bottom: 110,
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: 80,
                padding: EdgeInsets.only(top: 15),
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
                            backgroundColor:
                              _selectedInterval == el['key'] ? Colors.blueGrey : null,
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
      ])
    );
  }

  Widget renderOrderbook() {
    return (
      Container(
        height: viewHeight - 200,
        alignment: Alignment.center,
        width: double.infinity,
        color: Colors.black,
        child: (
          _loading
            ? CircularProgressIndicator()
            : DepthChart(_bids, _asks)
        ),
      )
    );
  }

  Widget renderDesc() {
    return (
      Container(
        padding: EdgeInsets.all(20),
        constraints: BoxConstraints(minHeight: viewHeight),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Текущая цена'),
                Text(_stockData?.currentPrice?.toString() ?? 'нет данных')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Дневной максимум'),
                Text(_stockData?.dayHigh?.toString() ?? 'нет данных')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Дневной минимум'),
                Text(_stockData?.dayLow?.toString() ?? 'нет данных')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('fiftyDayAverageChange'),
                Text('${_stockData?.fiftyDayAverageChange ?? '-'}%')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('regularMarketChange'),
                Text('${_stockData?.regularMarketChange ?? '-'}%')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('averageDailyVolume10Day'),
                Text('${_stockData?.averageDailyVolume10Day ?? '-'}')
              ],
            ),
          ],
        ),
      )
    );
  }

  Widget tabView(String name) {
    currentWidget() {
      switch (name) {
        case 'chart': return renderChart();
        case 'orderbook': return renderOrderbook();
        case 'desc': return renderDesc();
      }

      return Text('unknown');
    }

    return ListView(children: [currentWidget()]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
          appBar: AppBar(
            title: Text(widget.instrument?['name']),
            bottom: TabBar(
              controller: _controller,
              indicatorWeight: 0.5,
              tabs: tabs.map((t) => tabItem(t['label'], t['icon'])).toList(),
            ),
          ),
          body: TabBarView(
            controller: _controller,
            // dragStartBehavior: DragStartBehavior.down,
            children: tabs.map((t) => tabView(t['name'])).toList(),
          ),
       ),
    );
  }
}