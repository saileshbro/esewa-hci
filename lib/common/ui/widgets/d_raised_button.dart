import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:esewa_hci/common/extensions/extensions.dart';
import 'package:stacked_themes/stacked_themes.dart';

class DRaisedButton extends StatelessWidget {
  final bool loading;
  final String title;
  final VoidCallback onPressed;
  final bool hasBoxShadow;
  final bool disabled;
  final bool isExpanded;
  final Color color;
  final Color textColor;

  const DRaisedButton({
    @required this.title,
    this.loading = false,
    @required this.onPressed,
    this.hasBoxShadow = true,
    this.disabled = false,
    this.isExpanded = false,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled || loading ? null : onPressed,
      child: InkWell(
        child: Container(
          height: dimen_48,
          width: isExpanded ? double.maxFinite : dimen_110,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: disabled
                  ? Theme.of(context).disabledColor
                  : color != null
                      ? color
                      : Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(dimen_8.w),
              boxShadow: !disabled && hasBoxShadow
                  ? getBoxShadow(context, color: color)
                  : null),
          child: !loading
              ? Text(
                  title,
                  style: Theme.of(context).textTheme.button.copyWith(
                        color: textColor != null
                            ? textColor
                            : !locator<ThemeService>().isDarkMode
                                ? Colors.white
                                : disabled
                                    ? Colors.white
                                    : Colors.black,
                      ),
                  textAlign: TextAlign.center,
                )
              : Container(
                  height: dimen_48.w,
                  width: dimen_48.w,
                  padding: sPadding,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        !locator<ThemeService>().isDarkMode
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
        ),
      ),
    );
  }
}
