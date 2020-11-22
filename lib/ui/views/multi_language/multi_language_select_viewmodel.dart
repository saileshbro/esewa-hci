import 'package:esewa_hci/app/custom_base_view_model.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/helpers/show_custom_toast.dart';
import 'package:esewa_hci/models/language_model.dart';
import 'package:esewa_hci/services/language_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MultiLanguageSelectViewModel extends CustomBaseViewModel {
  Locale _locale;
  final LanguageService _languageService;

  MultiLanguageSelectViewModel(this._languageService);
  init(Locale currentLanguageCode) {
    _locale = currentLanguageCode;
    notifyListeners();
  }

  get languageCode => _locale;
  void toggleLanguageCode(LanguageModel model) {
    bool isSupported = Constants.languages.contains(model);
    if (isSupported) {
      _locale = model;
      _languageService.changeLocale(model);
      notifyListeners();
    } else {
      showCustomToast(
          message:
              "Currently only English and Nepali languages are included.\nहाल केवल अंग्रेजी र नेपाली भाषाहरू मात्र समावेश छन्।");
    }
  }
}
