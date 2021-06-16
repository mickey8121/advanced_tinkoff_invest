import 'package:tinkoff_invest/tinkoff_invest.dart';

durationByInterval(CandleResolution interval) {
  switch (interval) {
    case CandleResolution.hour:
      return Duration(days: 7);
    case CandleResolution.week:
    case CandleResolution.day:
      return Duration(days: 365);
    case CandleResolution.month:
      return Duration(days: 365 * 5);
    default:
      return Duration(days: 1);
  }
}