import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:advanced_tinkoff_invest/models/api.dart';
import 'package:advanced_tinkoff_invest/routes/conditionalRouter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<API>(
        create: (_) => API(),
        child: MaterialApp(
          title: 'Provider Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          home: ConditionalRouter(),
        ),
    );
  }
}
