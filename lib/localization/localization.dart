import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const supportedLocales = [
  const Locale('en'),
  const Locale('zh'),
];

Map<String, Map<String, String>> _strings = {
  'en': {
    'exchange_rates': 'Exchange rates',
  },
  'zh': {
    'exchange_rates': '匯率',
  },
};

class Strings {
  //
  final Locale locale;

  //
  Strings(this.locale);

  static Strings of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  String get exchangeRates => _value('exchange_rates');

  ///
  _value(name) => _strings[locale.languageCode][name];
}

class MyLocalizationsDelegate extends LocalizationsDelegate<Strings> {
  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<Strings> load(Locale locale) {
    return SynchronousFuture<Strings>(Strings(locale));
  }

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}
