import 'package:esewa_hci/app/custom_base_view_model.dart';
import 'package:esewa_hci/app/router.gr.dart';
import 'package:esewa_hci/common/helpers/show_not_implemented_toast.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class ThemeSelectionViewModel extends CustomBaseViewModel {
  final NavigationService _navigationService;
  AppThemeMode themeMode = AppThemeMode.powerSaving;

  ThemeSelectionViewModel(this._navigationService);
  void toggleTheme(AppThemeMode mode) {
    themeMode = mode;
    showNotImplementedToast();
    notifyListeners();
  }

  Future<void> onCheckPressed() async {
    await delay(seconds: 2);
    _navigationService.clearStackAndShow(Routes.welcomeView);
  }
}

enum AppThemeMode { light, dark, powerSaving }
