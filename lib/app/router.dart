import 'package:auto_route/auto_route_annotations.dart';
import 'package:esewa_hci/ui/views/auth_welcome/auth_welcome_view.dart';
import 'package:esewa_hci/ui/views/home/home_view.dart';
import 'package:esewa_hci/ui/views/language_select/language_select_view.dart';
import 'package:esewa_hci/ui/views/login/login_view.dart';
import 'package:esewa_hci/ui/views/login_signup/login_signup_view.dart';
import 'package:esewa_hci/ui/views/multi_language/multi_language_select_view.dart';
import 'package:esewa_hci/ui/views/onboarding/onboarding_view.dart';
import 'package:esewa_hci/ui/views/service_category/service_category_view.dart';
import 'package:esewa_hci/ui/views/settings/settings_view.dart';
import 'package:esewa_hci/ui/views/signup/signup_view.dart';
import 'package:esewa_hci/ui/views/startup/startup_view.dart';
import 'package:esewa_hci/ui/views/theme_selection/theme_selection_view.dart';
import 'package:esewa_hci/ui/views/welcome/welcome_view.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
    MaterialRoute(page: LanguageSelectView),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: ThemeSelectionView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: WelcomeView),
    MaterialRoute(page: LoginSignupView),
    MaterialRoute(page: AuthWelcomeView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: ServiceCategoryView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: MultiLanguageSelectView),
  ],
  preferRelativeImports: false,
)
class $Router {}
