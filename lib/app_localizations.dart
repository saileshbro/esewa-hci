import 'dart:convert';

import 'package:esewa_hci/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);
  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  String translate(String key) => _localizedStrings[key];
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationDelegate();
  Map<String, String> _localizedStrings;
  Future<bool> load() async {
    final jsonString =
        await rootBundle.loadString("assets/lang/${locale.languageCode}.json");
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    _localizedStrings = jsonMap.map(
      (key, value) => MapEntry(
        key,
        value.toString(),
      ),
    );
    return true;
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
    return Constants.languages.contains(locale);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
