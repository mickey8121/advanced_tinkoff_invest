import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tinkoff_invest/tinkoff_invest.dart';

import 'package:advanced_tinkoff_invest/models/api.dart';

import 'package:advanced_tinkoff_invest/screens/homeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _userToken = '';
  bool _isTrading = false;
  bool _rememberToken = false;
  bool _isLoading = false;

  void _submit() async {
    Portfolio? portfolio;
    
    setState(() => _isLoading = true);

    try {
      context.read<Api>().setInitApi(_userToken, !_isTrading);
      portfolio = await context.read<Api>().getPortfolio();
      print(portfolio);
    } catch (err) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(err as String),
                  Text('Check that your token is correct and try again'),
                ],
              ),
            ),
          );
        },
      );
    }

    setState(() => _isLoading = false);

    if (portfolio != null) {
      if (_rememberToken) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('userToken', _userToken);
      }

      print(portfolio);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 80, horizontal: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: TextStyle(height: 2.5, fontSize: 60, color: Color.fromARGB(200, 0, 0, 0)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Insert your token here',
                        ),
                        onChanged: (String value) => setState(() { _userToken = value; }),
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                      ),
                      SwitchListTile(
                        title: const Text('Trading'),
                        value: _isTrading,
                        onChanged: (bool val) => setState(() => _isTrading = val)
                      ),
                      SwitchListTile(
                        title: const Text('Remember Token'),
                        value: _rememberToken,
                        onChanged: (bool val) => setState(() => _rememberToken = val)
                      ),
                      SizedBox(height: 25),
                      ElevatedButton(
                        child: Text('ENTER'),
                        onPressed: _userToken.length > 0 && !_isLoading ? _submit: null,
                        style: ElevatedButton.styleFrom(primary: Colors.black),
                      )
                    ]
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
