import 'package:auto_size_text/auto_size_text.dart';
import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/common/ui/theme/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:stacked_themes/stacked_themes.dart';

void showCustomToast({
  String message,
}) {
  showToastWidget(
    Container(
      padding: sPadding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(dimen_8),
          color: !locator<ThemeService>().isDarkMode
              ? Colors.black
              : Colors.white),
      child: AutoSizeText(
        message,
        maxLines: 2,
        minFontSize: dimen_14.sp.ceilToDouble(),
        style: ThemeText.getTextTheme(
                locator<ThemeService>().selectedThemeMode ==
                        ThemeManagerMode.dark
                    ? ThemeMode.dark
                    : ThemeMode.light)
            .subtitle1
            .copyWith(
              color: locator<ThemeService>().isDarkMode
                  ? Colors.black
                  : Colors.white,
              fontWeight: FontWeight.bold,
            ),
      ),
    ),
  );
}
