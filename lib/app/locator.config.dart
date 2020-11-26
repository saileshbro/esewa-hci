// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:esewa_hci/ui/views/auth_welcome/auth_welcome_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:esewa_hci/ui/views/home/home_viewmodel.dart';
import 'package:esewa_hci/ui/views/language_select/language_select_viewmodel.dart';
import 'package:esewa_hci/services/language_service.dart';
import 'package:esewa_hci/language_view_model.dart';
import 'package:esewa_hci/ui/views/login_signup/login_signup_viewmodel.dart';
import 'package:esewa_hci/ui/views/login/login_viewmodel.dart';
import 'package:esewa_hci/ui/views/multi_language/multi_language_select_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:esewa_hci/ui/views/onboarding/onboarding_viewmodel.dart';
import 'package:esewa_hci/ui/views/service_category/service_category_viewmodel.dart';
import 'package:esewa_hci/ui/views/settings/settings_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:esewa_hci/services/shared_preferences_service.dart';
import 'package:esewa_hci/ui/views/signup/signup_viewmodel.dart';
import 'package:esewa_hci/ui/views/startup/startup_viewmodel.dart';
import 'package:esewa_hci/ui/views/theme_selection/theme_selection_viewmodel.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:esewa_hci/services/third_party_services.dart';
import 'package:esewa_hci/ui/views/welcome/welcome_viewmodel.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<DialogService>(() => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.factory<ServiceCategoryViewModel>(() => ServiceCategoryViewModel());
  gh.lazySingleton<SettingsViewModel>(
      () => SettingsViewModel(get<NavigationService>()));
  final sharedPreferences = await thirdPartyServicesModule.prefs;
  gh.factory<SharedPreferences>(() => sharedPreferences);
  gh.lazySingleton<SharedPreferencesService>(
      () => SharedPreferencesService(get<SharedPreferences>()));
  gh.lazySingleton<SignupViewModel>(
      () => SignupViewModel(get<NavigationService>()));
  gh.lazySingleton<SnackbarService>(
      () => thirdPartyServicesModule.snackbarService);
  gh.lazySingleton<StartUpViewModel>(() => StartUpViewModel(
      get<NavigationService>(), get<SharedPreferencesService>()));
  gh.lazySingleton<ThemeService>(() => thirdPartyServicesModule.themeService);
  gh.lazySingleton<WelcomeViewModel>(
      () => WelcomeViewModel(get<NavigationService>()));
  gh.lazySingleton<AuthWelcomeViewModel>(
      () => AuthWelcomeViewModel(get<NavigationService>()));
  gh.lazySingleton<HomeViewModel>(
      () => HomeViewModel(get<NavigationService>()));
  gh.lazySingleton<LanguageService>(
      () => LanguageService(get<SharedPreferencesService>()));
  gh.lazySingleton<LanguageViewModel>(
      () => LanguageViewModel(get<LanguageService>()));
  gh.lazySingleton<LoginSignupViewModel>(
      () => LoginSignupViewModel(get<NavigationService>()));
  gh.lazySingleton<LoginViewModel>(
      () => LoginViewModel(get<NavigationService>()));
  gh.lazySingleton<MultiLanguageSelectViewModel>(
      () => MultiLanguageSelectViewModel(get<LanguageService>()));
  gh.lazySingleton<OnboardingViewModel>(() => OnboardingViewModel(
      get<NavigationService>(), get<SharedPreferencesService>()));
  gh.lazySingleton<ThemeSelectionViewModel>(
      () => ThemeSelectionViewModel(get<ThemeService>()));
  gh.lazySingleton<LanguageSelectViewModel>(() => LanguageSelectViewModel(
      get<NavigationService>(), get<LanguageService>()));
  return get;
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackbarService => SnackbarService();
}
