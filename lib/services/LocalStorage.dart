import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage({ required this.prefs });
  final SharedPreferences prefs;

  void setData({ required String key, required data }) {
    final String rawJson = jsonEncode(data);
    prefs.setString(key, rawJson);
  }

  dynamic getData({ required String key }) {
    try {
      final String dataAsString = prefs.getString(key) ?? '';
      var data = jsonDecode(dataAsString);
      return data;
    } catch (e) {
      return null;
    }
  }
}
