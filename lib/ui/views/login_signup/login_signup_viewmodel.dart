import 'package:esewa_hci/app/custom_base_view_model.dart';
import 'package:esewa_hci/app/router.gr.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class LoginSignupViewModel extends CustomBaseViewModel {
  final NavigationService _navigationService;

  LoginSignupViewModel(this._navigationService);
  void onSignupPressed() {
    _navigationService.navigateTo(Routes.signupView);
  }

  void onLoginPressed() {
    _navigationService.navigateTo(Routes.loginView);
  }

  void onSkipPressed() {}
}
