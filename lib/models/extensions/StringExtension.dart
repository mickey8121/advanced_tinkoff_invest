import 'package:advanced_tinkoff_invest/utils/regexes.dart';

extension StringExtension on String {
  String capitalize() => this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
  String splitPascalCase() => this.split(splitPascalCaseRegex).join(' ');
  int parseInt() => int.parse(this);
}