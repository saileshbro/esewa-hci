import 'package:esewa_hci/app_localizations.dart';
import 'package:flutter/material.dart';

extension StringExtension on String {
  String t(BuildContext context) =>
      AppLocalizations.of(context).translate(this);
}
