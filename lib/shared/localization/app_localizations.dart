import 'package:flutter/widgets.dart';

import 'strings_en.dart';
import 'strings_ru.dart';
import 'strings_zh.dart';

class AppLocalizations {
  const AppLocalizations(this.locale);
  final Locale locale;
  static const supportedLocales = [Locale('en'), Locale('ru'), Locale('zh')];
  static const delegate = _Delegate();
  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  static const _strings = {'en': stringsEn, 'ru': stringsRu, 'zh': stringsZh};
  String operator [](String key) =>
      _strings[locale.languageCode]?[key] ?? stringsEn[key] ?? key;
}

class _Delegate extends LocalizationsDelegate<AppLocalizations> {
  const _Delegate();
  @override
  bool isSupported(Locale locale) => AppLocalizations.supportedLocales.any(
    (item) => item.languageCode == locale.languageCode,
  );
  @override
  Future<AppLocalizations> load(Locale locale) async =>
      AppLocalizations(locale);
  @override
  bool shouldReload(_Delegate old) => false;
}
