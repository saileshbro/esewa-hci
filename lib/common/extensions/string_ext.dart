import 'package:esewa_hci/app_localizations.dart';
import 'package:flutter/material.dart';

extension StringExtension on String {
  String t(BuildContext context, {List<String> args}) {
    String res = AppLocalizations.of(context).translate(this);
    if (args != null) {
      return _replaceArgs(res, args);
    }
    return res;
  }
}

String _replaceArgs(String res, List<String> args) {
  if (args == null || args.isEmpty) return res;
  args.forEach((String str) => res = res.replaceFirst(_replaceArgRegex, str));
  return res;
}

final RegExp _replaceArgRegex = RegExp(r'{}');
