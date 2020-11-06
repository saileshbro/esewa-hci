import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:esewa_hci/common/extensions/extensions.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _latoTextTheme => GoogleFonts.latoTextTheme();

  static TextStyle get _blackHeadline6 => _latoTextTheme.headline6.copyWith(
        fontSize: dimen_20.sp,
        color: Colors.black,
      );

  static TextStyle get _blackHeadline5 => _latoTextTheme.headline5.copyWith(
        fontSize: dimen_24.sp,
        color: Colors.black,
      );

  static TextStyle get blackSubtitle1 => _latoTextTheme.subtitle1.copyWith(
        fontSize: dimen_16.sp,
        color: Colors.black,
      );

  static TextStyle get _blackButton => _latoTextTheme.button.copyWith(
        fontSize: dimen_18.sp,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      );

  static TextStyle get blackBodyText2 => _latoTextTheme.bodyText2.copyWith(
        color: Colors.black,
        fontSize: dimen_14.sp,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextTheme getTextTheme() => TextTheme(
        headline5: _blackHeadline5,
        headline6: _blackHeadline6,
        subtitle1: blackSubtitle1,
        bodyText2: blackBodyText2,
        button: _blackButton,
      );
}
