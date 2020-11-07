import 'package:esewa_hci/app/custom_base_view_model.dart';
import 'package:esewa_hci/app/router.gr.dart';
import 'package:esewa_hci/common/helpers/validators.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class SignupViewModel extends CustomBaseViewModel {
  final NavigationService _navigationService;
  String gender = "";
  String phone = "";
  String name = "";
  SignupViewModel(this._navigationService);
  bool get isPhoneValid => validatePhone(phone);
  bool _isAgreed = false;
  bool get isNameValid => validateName(phone);

  get isAgreed => _isAgreed;

  void onLoginPressed() {
    _navigationService.replaceWith(Routes.loginView);
  }

  onPhoneChanged(String p1) {
    phone = p1;
    notifyListeners();
  }

  onNameChanged(String p1) {
    name = p1;
    notifyListeners();
  }

  void toggleAgree(bool value) {
    _isAgreed = value;
    notifyListeners();
  }

  Future<void> onSignupPressed() async {
    await delay(seconds: 2);
  }

  void onGenderChanged(String value) {
    gender = value;
    notifyListeners();
  }
}
