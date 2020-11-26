import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

enum SnackbarType { success, error }
void setupSnackbarUi(BuildContext context) {
  final service = locator<SnackbarService>();

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
      backgroundColor: Theme.of(context).canvasColor,
      textColor: Theme.of(context).primaryColor,
      borderRadius: dimen_8,
      borderColor: Theme.of(context).primaryColor,
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
}
