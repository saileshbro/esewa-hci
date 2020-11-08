// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:esewa_hci/ui/views/auth_welcome/auth_welcome_view.dart';
import 'package:esewa_hci/ui/views/home/home_view.dart';
import 'package:esewa_hci/ui/views/language_select/language_select_view.dart';
import 'package:esewa_hci/ui/views/login/login_view.dart';
import 'package:esewa_hci/ui/views/login_signup/login_signup_view.dart';
import 'package:esewa_hci/ui/views/onboarding/onboarding_view.dart';
import 'package:esewa_hci/ui/views/signup/signup_view.dart';
import 'package:esewa_hci/ui/views/startup/startup_view.dart';
import 'package:esewa_hci/ui/views/theme_selection/theme_selection_view.dart';
import 'package:esewa_hci/ui/views/welcome/welcome_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String startUpView = '/';
  static const String languageSelectView = '/language-select-view';
  static const String onboardingView = '/onboarding-view';
  static const String themeSelectionView = '/theme-selection-view';
  static const String loginView = '/login-view';
  static const String signupView = '/signup-view';
  static const String welcomeView = '/welcome-view';
  static const String loginSignupView = '/login-signup-view';
  static const String authWelcomeView = '/auth-welcome-view';
  static const String homeView = '/home-view';
  static const all = <String>{
    startUpView,
    languageSelectView,
    onboardingView,
    themeSelectionView,
    loginView,
    signupView,
    welcomeView,
    loginSignupView,
    authWelcomeView,
    homeView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.languageSelectView, page: LanguageSelectView),
    RouteDef(Routes.onboardingView, page: OnboardingView),
    RouteDef(Routes.themeSelectionView, page: ThemeSelectionView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.signupView, page: SignupView),
    RouteDef(Routes.welcomeView, page: WelcomeView),
    RouteDef(Routes.loginSignupView, page: LoginSignupView),
    RouteDef(Routes.authWelcomeView, page: AuthWelcomeView),
    RouteDef(Routes.homeView, page: HomeView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartUpView(),
        settings: data,
      );
    },
    LanguageSelectView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LanguageSelectView(),
        settings: data,
      );
    },
    OnboardingView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OnboardingView(),
        settings: data,
      );
    },
    ThemeSelectionView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ThemeSelectionView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    SignupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignupView(),
        settings: data,
      );
    },
    WelcomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WelcomeView(),
        settings: data,
      );
    },
    LoginSignupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginSignupView(),
        settings: data,
      );
    },
    AuthWelcomeView: (data) {
      final args = data.getArgs<AuthWelcomeViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => AuthWelcomeView(
          key: args.key,
          userFirstName: args.userFirstName,
        ),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AuthWelcomeView arguments holder class
class AuthWelcomeViewArguments {
  final Key key;
  final String userFirstName;
  AuthWelcomeViewArguments({this.key, @required this.userFirstName});
}
