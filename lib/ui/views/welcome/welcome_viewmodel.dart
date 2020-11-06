import 'package:esewa_hci/app/custom_base_view_model.dart';
import 'package:esewa_hci/app/router.gr.dart';
import 'package:esewa_hci/common/helpers/validators.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class WelcomeViewModel extends CustomBaseViewModel {
  final NavigationService _navigationService;
  String phone = "";

  WelcomeViewModel(this._navigationService);
  void onSubmitPressed() async {
    await delay(seconds: 2);
    _navigationService.clearStackAndShow(Routes.themeSelectionView);
  }

  void onPhoneChanged(val) {
    phone = val;
    notifyListeners();
  }

  bool get isPhoneValid => validatePhone(phone);
}
