import 'package:esewa_hci/app/custom_base_view_model.dart';
import 'package:esewa_hci/app/logger.dart';
import 'package:esewa_hci/app/router.gr.dart';
import 'package:esewa_hci/services/shared_preferences_service.dart';
import 'package:flutter/scheduler.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class StartUpViewModel extends CustomBaseViewModel {
  final Logger logger = getLogger("StartUpViewModel");
  final NavigationService _navigationService;
  // ignore: unused_field
  final SharedPreferencesService _sharedPreferencesService;
  StartUpViewModel(
    this._navigationService,
    this._sharedPreferencesService,
  );
  Future<void> handleStartupViewLogic() async {
    // _sharedPreferencesService.removeOnboardingVisited();
    await Future.delayed(Duration(seconds: 2));
    // if (_sharedPreferencesService.localeCode == null) {
    SchedulerBinding.instance.addPostFrameCallback((timestamp) {
      _navigationService.clearStackAndShow(Routes.languageSelectView);
    });
    //   notifyListeners();
    // } else {
    //   locator<LanguageBloc>().add(ToggleLanguageEvent(
    //       LanguageModel(code: _sharedPreferencesService.localeCode)));
    // }
    // if (!_sharedPreferencesService.onboardingVisited) {
    //   SchedulerBinding.instance.addPostFrameCallback((timestamp) {
    //     _navigationService.clearStackAndShow(Routes.onboardingView);
    //   });
    //   notifyListeners();
    // } else {
    //   SchedulerBinding.instance.addPostFrameCallback((timestamp) {
    //     _navigationService.clearStackAndShow(Routes.welcomeView);
    //   });
    //   notifyListeners();
    // }
  }
}
