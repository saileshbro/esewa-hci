import 'package:esewa_hci/models/language_model.dart';
import 'package:esewa_hci/services/language_service.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class LanguageViewModel extends StreamViewModel {
  final LanguageService _languageService;
  LanguageViewModel(this._languageService);
  Stream get stream => _languageService.languageStream;
  LanguageModel get appLocale => _languageService.locale;
}
