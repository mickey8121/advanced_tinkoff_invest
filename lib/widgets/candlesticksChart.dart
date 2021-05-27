import 'package:flutter/material.dart';
import 'package:candlesticks/candlesticks.dart' show Candlesticks, Candle;

class CandlesticksChart extends StatelessWidget {
  final candles;
  final isLoading;
  const CandlesticksChart({ Key? key, required List this.candles, bool this.isLoading = false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(candles);

    return Container(
      height: 300.0,
      child: (
        isLoading
          ? Center(child: Text('Loading', style: Theme.of(context).textTheme.headline3))
          : (
            candles == null || candles.length == 0
              ? Center(child: Text('Candles is not found...', style: Theme.of(context).textTheme.headline5))
              : Candlesticks(
                  candles: candles.map<Candle>((candle) => Candle(
                    open: candle.o,
                    high: candle.h,
                    low: candle.l,
                    close: candle.c,
                    volume: candle.v.toDouble(),
                  )).toList(),
                )
            )
      )
    );
  }
}