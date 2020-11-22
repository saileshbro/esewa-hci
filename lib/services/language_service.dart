import 'dart:async';

import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/models/language_model.dart';
import 'package:esewa_hci/services/shared_preferences_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LanguageService {
  LanguageModel _locale = Constants.languages.first;
  final SharedPreferencesService _sharedPreferencesService;
  LanguageModel get locale => _locale;
  Stream<LanguageModel> get languageStream => _languageStream.stream;
  StreamController<LanguageModel> _languageStream =
      StreamController<LanguageModel>.broadcast();

  LanguageService(this._sharedPreferencesService) {
    if (_sharedPreferencesService.locale == null) {
      return;
    }
    _locale = _sharedPreferencesService.locale;
    print(_locale);
    _languageStream.add(_locale);
    return;
  }
  Future<void> changeLocale(LanguageModel model) async {
    _locale = model;
    _languageStream.add(model);
    await _sharedPreferencesService.setLocale(model);
  }

  void close() {
    _languageStream.close();
  }
}
