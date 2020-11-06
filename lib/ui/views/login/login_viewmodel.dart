import 'package:esewa_hci/app/custom_base_view_model.dart';
import 'package:esewa_hci/common/helpers/validators.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginViewModel extends CustomBaseViewModel {
  String emailOrPhone = "";
  String passwordOrMPIN = "";

  bool rememberMe = false;

  bool get isPhoneValid => validatePassword(emailOrPhone);

  bool get isPasswordValid => validatePassword(passwordOrMPIN);

  void toggleRememberMe(val) {
    rememberMe = val;
    notifyListeners();
  }

  void onPhoneChanged(String p1) {
    emailOrPhone = p1;
    notifyListeners();
  }

  void onLoginPressed() async {
    await delay(seconds: 2);
  }

  void onPasswordChanged(String p1) {
    passwordOrMPIN = p1;
    notifyListeners();
  }

  void onSignupPressed() {}

  void forgotPasswordPressed() {}
}
