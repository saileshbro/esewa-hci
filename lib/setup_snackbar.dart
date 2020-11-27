import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

enum SnackbarType { success, error, timer }
void setupSnackbarUi(ThemeData themeData) {
  final service = locator<SnackbarService>();

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
      backgroundColor: themeData.canvasColor,
      textColor: themeData.primaryColor,
      borderRadius: dimen_8,
      borderColor: themeData.primaryColor,
      margin: sPadding,
    ),
  );

  service.registerCustomSnackbarConfig(
      variant: SnackbarType.error,
      config: SnackbarConfig(
        backgroundColor: Colors.white,
        textColor: Colors.red,
        borderRadius: dimen_8,
        borderColor: Colors.red,
        margin: sPadding,
      ));
  service.registerCustomSnackbarConfig(
      variant: SnackbarType.timer,
      config: SnackbarConfig(
        backgroundColor: themeData.canvasColor,
        textColor: themeData.primaryColor,
        borderRadius: dimen_8,
        borderColor: themeData.primaryColor,
        margin: sPadding,
        showProgressIndicator: true,
      ));
}
