
import 'package:advanced_tinkoff_invest/screens/incomeDataScreen.dart';
import 'package:advanced_tinkoff_invest/utils/currencySymbols.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:vibration/vibration.dart';

class IncomeCard extends StatelessWidget {
  final Map incomeData;
  const IncomeCard({ Key? key, required this.incomeData }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final instrument = incomeData['instrument'];
    final activePosition = instrument['activePosition'];
    final String currencySymbol = currencySymbols['${instrument['currency'] ?? ''}'] ?? '';
    
    final double income = incomeData['income'] ?? 0;
    final double totalIncome = incomeData['totalIncome'] ?? 0;
    final String incomeString = income.toStringAsFixed(2);
    final String totalIncomeString = totalIncome.toStringAsFixed(2);

    return Container(
      child: Card(
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.blueGrey[100],
          highlightColor: Colors.transparent,
          onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) => IncomeDataScreen(incomeData: incomeData))),
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  instrument['name'],
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                Text(
                  instrument['ticker'],
                  style: TextStyle(
                    color: Colors.cyan[200],
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Доход',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Text(
                          '${income > 0 ? '+' : ''}$incomeString',
                          style: TextStyle(
                            fontSize: 16,
                            color: (
                              income.isNegative
                                ? Colors.red[300]
                                : income != 0
                                  ? Colors.lightGreen[300]
                                  : null
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          currencySymbol,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
                if (activePosition != null) Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Баланс(+${activePosition['lots']})',
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      children: [
                        Text(
                          '${totalIncome > 0 ? '+' : ''}$totalIncomeString',
                          style: TextStyle(
                            fontSize: 16,
                            color: (
                              totalIncome.isNegative
                                ? Colors.red[200]
                                : totalIncome != 0
                                  ? Colors.lightGreen[300]
                                  : null
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          currencySymbol,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
                
                // SizedBox(height: 10),
                // Text(instrumentData['name'], style: TextStyle(fontSize: 16)),
                // SizedBox(height: 10),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       // 'Face Value:',
                //       'Text',
                //       style: TextStyle(fontSize: 16),
                //     ),
                //     SizedBox(width: 5),
                //     Text(
                //       // instrumentData['faceValue'].toString(),
                //       'Text',
                //       style: TextStyle(fontSize: 16, color: Colors.deepOrange),
                //     ),
                //     SizedBox(width: 1),
                //     Text(
                //       // ,
                //       'Text',
                //       style: TextStyle(fontSize: 16, color: Colors.deepOrange),
                //     ),
                //   ],
                // ),
              ]
            )
          )
        ),
      ),
    );
  }
}