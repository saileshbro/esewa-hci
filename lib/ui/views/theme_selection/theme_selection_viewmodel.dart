import 'package:esewa_hci/app/custom_base_view_model.dart';
import 'package:esewa_hci/app/router.gr.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

@lazySingleton
class ThemeSelectionViewModel extends CustomBaseViewModel {
  final NavigationService _navigationService;
  final ThemeService _themeService;
  ThemeManagerMode themeMode;

  ThemeSelectionViewModel(this._navigationService, this._themeService) {
    themeMode = _themeService.selectedThemeMode;
  }
  void toggleTheme(ThemeManagerMode mode) {
    themeMode = mode;
    _themeService.setThemeMode(mode);
    notifyListeners();
  }

  Future<void> onCheckPressed() async {
    await delay(seconds: 2);
    _navigationService.clearStackAndShow(Routes.welcomeView);
  }
}
