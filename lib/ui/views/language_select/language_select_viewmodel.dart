import 'package:esewa_hci/app/custom_base_view_model.dart';
import 'package:esewa_hci/services/shared_preferences_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LanguageSelectViewModel extends CustomBaseViewModel {
  final SharedPreferencesService _preferencesService;
  String _languageCode = "";

  LanguageSelectViewModel(this._preferencesService);

  get isLanguageSelected => _languageCode.isNotEmpty;
  void setLanguageCode(String s) async {
    _languageCode = s;
    await _preferencesService.setLocaleCode(s);
    notifyListeners();
  }

  bool isLanguage(String s) {
    return _languageCode == s;
  }
}
