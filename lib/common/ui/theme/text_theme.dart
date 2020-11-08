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
  static TextStyle get _blackHeadline4 => _latoTextTheme.headline4.copyWith(
        fontSize: dimen_34.sp,
        color: Colors.black,
      );

  static TextStyle get _blackSubtitle1 => _latoTextTheme.subtitle1.copyWith(
        fontSize: dimen_16.sp,
        color: Colors.black,
      );
  static TextStyle get _blackSubtitle2 => _latoTextTheme.subtitle2.copyWith(
        fontSize: dimen_14.sp,
        color: Colors.black,
      );

  static TextStyle get _blackButton => _latoTextTheme.button.copyWith(
        fontSize: dimen_14.sp,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get _blackBodyText2 => _latoTextTheme.bodyText2.copyWith(
        color: Colors.black,
        fontSize: dimen_14.sp,
      );
  static TextStyle get _blackCaption => _latoTextTheme.caption.copyWith(
        color: Colors.black,
        fontSize: dimen_12.sp,
      );

  static TextTheme getTextTheme() => TextTheme(
        headline6: _blackHeadline6,
        headline5: _blackHeadline5,
        headline4: _blackHeadline4,
        subtitle1: _blackSubtitle1,
        subtitle2: _blackSubtitle2,
        button: _blackButton,
        bodyText2: _blackBodyText2,
        caption: _blackCaption,
      );
}
