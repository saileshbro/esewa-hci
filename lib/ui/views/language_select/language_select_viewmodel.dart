import 'package:esewa_hci/app/custom_base_view_model.dart';
import 'package:esewa_hci/app/router.gr.dart';
import 'package:esewa_hci/models/language_model.dart';
import 'package:esewa_hci/services/language_service.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class LanguageSelectViewModel extends CustomBaseViewModel {
  final NavigationService _navigationService;
  final LanguageService _languageService;
  LanguageModel get locale => _languageService.locale;
  String _languageCode = "";
  String get languageCode => _languageCode;

  LanguageSelectViewModel(this._navigationService, this._languageService);

  get isLanguageSelected => _languageCode.isNotEmpty;
  void setLanguageCode(LanguageModel model) async {
    _languageCode = model.languageCode;
    _languageService.changeLocale(model);
    notifyListeners();
  }

  void onLanguageSelected() {
    _navigationService.navigateTo(Routes.onboardingView);
  }
}
