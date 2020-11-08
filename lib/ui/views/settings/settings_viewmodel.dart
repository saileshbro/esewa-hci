import 'package:esewa_hci/app/custom_base_view_model.dart';
import 'package:esewa_hci/app/router.gr.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class SettingsViewModel extends CustomBaseViewModel {
  final NavigationService _navigationService;

  SettingsViewModel(this._navigationService);
  onChangeLanguagePressed() {
    _navigationService.navigateTo(Routes.multiLanguageSelectView);
  }
}
