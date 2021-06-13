import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:advanced_tinkoff_invest/models/api.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _userToken = '';
  bool _isTrading = true;
  bool _rememberToken = false;
  bool _isLoading = false;

  void _submit() async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    if (!(_userToken is String)) return;
    
    setState(() => _isLoading = true);

    try {
      await context.read<API>().login(_userToken, _rememberToken, !_isTrading);
    } catch (err) {
      setState(() => _isLoading = false);

      final snackBar = SnackBar(
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                err as String,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Проверьте правильность введенного токена и повторите попытку',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ]
          )
        )
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 60),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'С возвращением!',
                      style: TextStyle(height: 2.5, fontSize: 20, letterSpacing: 1, wordSpacing: 1),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 60),
                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'Введите токен',
                              ),
                              onChanged: (String value) => setState(() { _userToken = value; }),
                              obscureText: true,
                              autocorrect: false,
                            ),
                            SwitchListTile(
                              title: const Text('Трейдинг'),
                              value: _isTrading,
                              onChanged: (bool val) => setState(() => _isTrading = val),
                            ),
                            SwitchListTile(
                              title: const Text('Запомнить токен'),
                              value: _rememberToken,
                              onChanged: (bool val) => setState(() => _rememberToken = val)
                            ),
                            SizedBox(height: 25),
                            ElevatedButton(
                              child: Text('ВОЙТИ'),
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
            ],
          ),
        )
      ),
    );
  }
}
