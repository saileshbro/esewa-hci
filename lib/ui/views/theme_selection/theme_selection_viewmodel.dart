import 'package:esewa_hci/app/custom_base_view_model.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_themes/stacked_themes.dart';

@lazySingleton
class ThemeSelectionViewModel extends CustomBaseViewModel {
  final ThemeService _themeService;
  ThemeManagerMode themeMode;

  ThemeSelectionViewModel(this._themeService) {
    themeMode = _themeService.selectedThemeMode;
  }
  void toggleTheme(ThemeManagerMode mode) {
    themeMode = mode;
    _themeService.setThemeMode(mode);
    notifyListeners();
  }

  Future<void> onCheckPressed() async {
    await delay(seconds: 2);
  }
}
