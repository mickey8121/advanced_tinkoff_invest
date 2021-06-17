import 'package:advanced_tinkoff_invest/models/extensions/StringExtension.dart';

const Map<String, String> operationLocale = {
  'buy': 'покупка',
  'buyCard': 'покупка картой',
  'sell': 'продажа',
  'brokerCommission': 'комиссия брокера',
  'exchangeCommission': 'комиссия биржы',
  'serviceCommission': 'сервисная комиссия',
  'marginCommission': 'маржинальная комиссия',
  'otherCommission': 'комиссия',
  'payIn': 'зачисление',
  'payOut': 'вывод средств',
  'tax': 'налог',
  'taxLucre': 'налоговая выгода',
  'taxDividend': 'налог на дивиденды',
  'taxCoupon': 'налоговый купон',
  'taxBack': 'налоговый вычет',
  'repayment': 'возмещение',
  'partRepayment': 'частичное возмещение',
  'coupon': 'купон',
  'dividend': 'дивиденды',
  // 'securityIn': '',
  // 'securityOut': '',
};

const Map<String, String> instrumentTypeLocale = {
  'stock': 'акция',
  'currency': 'валюта',
  'bond': 'облигация',
  // 'etf': 'фонд',
};

String translateOperationType(String operationTypeName) {
  final operationType = operationTypeName.toLowerCase();
  final operationTypeRus = operationLocale[operationType];

  return (operationTypeRus ?? operationType).splitPascalCase().capitalize();
}

String translateInstrumentType(String instrumentTypeName) {
  final instrumentType = instrumentTypeName.toLowerCase();
  final instrumentTypeRus = instrumentTypeLocale[instrumentType];

  return (instrumentTypeRus ?? instrumentType).splitPascalCase().capitalize();
}