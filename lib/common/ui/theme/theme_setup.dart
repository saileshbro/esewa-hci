import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/ui/theme/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData kLightThemeData = ThemeData.light().copyWith(
  unselectedWidgetColor: Constants.primaryGreenLight,
  primaryColor: Constants.primaryGreenLight,
  scaffoldBackgroundColor: Constants.backgroundColorLight,
  accentColor: Constants.primaryGreenLight.withOpacity(0.4),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: ThemeText.getTextTheme(ThemeMode.light),
  appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      )),
  iconTheme: IconThemeData(
    color: Constants.primaryGreenLight,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Constants.textFieldBackgroundColorLight,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  splashColor: Constants.primaryGreenLight.withOpacity(0.4),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Constants.primaryGreenLight,
  ),
);
ThemeData kDarkThemeData = ThemeData.dark().copyWith(
  unselectedWidgetColor: Constants.primaryGreenDark,
  primaryColor: Constants.primaryGreenDark,
  scaffoldBackgroundColor: Constants.backgroundColorDark,
  accentColor: Constants.primaryGreenDark.withOpacity(0.4),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: ThemeText.getTextTheme(ThemeMode.dark),
  appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      )),
  iconTheme: IconThemeData(
    color: Constants.primaryGreenDark,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Constants.textFieldBackgroundColorDark,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  splashColor: Constants.primaryGreenDark.withOpacity(0.4),
  // disabledColor: Constants.textFieldBackgroundColorLight,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Constants.primaryGreenDark,
  ),
);
