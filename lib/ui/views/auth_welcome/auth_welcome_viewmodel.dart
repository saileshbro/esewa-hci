import 'package:esewa_hci/app/custom_base_view_model.dart';
import 'package:esewa_hci/app/router.gr.dart';
import 'package:esewa_hci/common/helpers/show_not_implemented_toast.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class AuthWelcomeViewModel extends CustomBaseViewModel {
  final NavigationService _navigationService;

  AuthWelcomeViewModel(this._navigationService);
  onCashPointsPressed() => showNotImplementedToast();

  onBankAccountPressed() => showNotImplementedToast();

  void onSkipPressed() => _navigationService.clearStackAndShow(Routes.homeView);
}
