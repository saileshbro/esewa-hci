import 'package:esewa_hci/app/logger.dart';
import 'package:esewa_hci/app/router.gr.dart';
import 'package:esewa_hci/services/shared_preferences_service.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class OnboardingViewModel extends IndexTrackingViewModel {
  final NavigationService _navigationService;
  final logger = getLogger("OnboardingViewModel");
  final SharedPreferencesService _sharedPreferencesService;
  OnboardingViewModel(this._navigationService, this._sharedPreferencesService);

  Future<void> onGetStartedPressed() async {
    await _sharedPreferencesService.setOnboardingVisited();
    _navigationService.navigateTo(Routes.welcomeView);
  }
}
