import 'package:advanced_tinkoff_invest/models/api.dart';
import 'package:advanced_tinkoff_invest/screens/instrumentScreen.dart';
import 'package:advanced_tinkoff_invest/utils/currencySymbols.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:vibration/vibration.dart';

class InstrumentCard extends StatefulWidget {
  final Map instrumentData;
  InstrumentCard({ Key? key, required this.instrumentData }) : super(key: key);

  @override
  _InstrumentCardState createState() => _InstrumentCardState(instrumentData);
}

class _InstrumentCardState extends State<InstrumentCard> {
  _InstrumentCardState(this.instrumentData);
  
  Map instrumentData;
  bool _isLoadingPrice = true;
  
  @override
  void initState() {
    super.initState();

    _getInstrumentPrice();
  }

  _getInstrumentPrice() async {
    double? currentPrice;

    try {
      final price = await context.read<API>().stockCurrentPrice(instrumentData['ticker']);
      currentPrice = price;
    } catch (e) {
      print('_getInstrumentPrice ${(e as dynamic).message}');
    }

    if (mounted)
      setState(() {
        instrumentData = {
          ...instrumentData,
          'currentPrice': currentPrice,
        };
        _isLoadingPrice = false;
      });
  }

  // @override
  // void dispose() async {
  //   super.dispose();
  //   if (_unsubscribe != null) _unsubscribe!();
  // }

  // _subscribeToInstrumentInfo() async {
  //   print(instrumentData['figi']);

  //   final unsubscribe = context.read<API>().subscribeToOrderbook(
  //     instrumentData['figi'],
  //     10,
  //     (data) => setState(
  //       () {
  //         _orderbookData = {
  //           'event': data.event,
  //           'time': data.time,
  //           'payload': data.payload,
  //         };
  //       }
  //     ),
  //   );

  //   setState(() => _unsubscribe = unsubscribe);
  // }

  @override
  Widget build(BuildContext context) {
    final activePosition = instrumentData['activePosition'];
    final price = instrumentData['currentPrice'] ?? '—';

    return Card(
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.blueGrey[100],
        highlightColor: Colors.transparent,
        onTap: () async {
          if (await Vibration.hasAmplitudeControl())
            Vibration.vibrate(pattern: [0, 100], intensities: [0, 50]);

          Navigator.push(context, MaterialPageRoute(builder: (context) => InstrumentScreen(instrument: instrumentData)));
        },
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (activePosition != null)
                ...[Text('${activePosition['lots']} are available'), SizedBox(height: 100)],

              Text(instrumentData['ticker'], style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold  )),
              SizedBox(height: 10),
              Text(instrumentData['name'], style: TextStyle(fontSize: 16)),

              ...[
                SizedBox(height: 10),
                Container(
                  height: 20,
                  child: Text(
                    _isLoadingPrice ? 'price loading...' : '$price',
                    style: (
                      _isLoadingPrice
                        ? TextStyle(fontSize: 14)
                        : TextStyle(fontSize: 18, color: Colors.green[600])
                    ),
                  ),
                )
              ],

              // only bonds have a faceValue
              if (instrumentData['faceValue'] != null) Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 5),
                  Text('Face Value:', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 5),
                  Text(instrumentData['faceValue'].toString(), style: TextStyle(fontSize: 16, color: Colors.deepOrange)),
                  SizedBox(width: 1),
                  Text(
                    currencySymbols['${instrumentData['currency'] ?? ''}'] as String,
                    style: TextStyle(fontSize: 16, color: Colors.deepOrange),
                  ),
                ],
              ),
            ]
          )
        )
      ),
    );
  }
}