import 'package:advanced_tinkoff_invest/screens/bondsScreen.dart';
import 'package:advanced_tinkoff_invest/screens/instrumentScreen.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:vibration/vibration.dart';
import 'package:tinkoff_invest/tinkoff_invest.dart';

class InstrumentCard extends StatelessWidget {
  final MarketInstrument instrumentData;
  InstrumentCard({ Key? key, required this.instrumentData }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

          Navigator.push(context, MaterialPageRoute(builder: (context) => InstrumentScreen(bondFigi: instrumentData.figi)));
        },
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(instrumentData.ticker, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold  )),
              SizedBox(height: 10),
              Text(instrumentData.name, style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),

              // only bonds have a faceValue
              if (instrumentData.faceValue != null) Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Face Value:', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 5),
                  Text(instrumentData.faceValue.toString(), style: TextStyle(fontSize: 16, color: Colors.deepOrange)),
                  SizedBox(width: 1),
                  Text(
                    currencySymbols['${instrumentData.currency?.name ?? ''}'] as String,
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