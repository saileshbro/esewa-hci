import 'package:auto_size_text/auto_size_text.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/helpers/show_not_implemented_toast.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:esewa_hci/app/locator.dart';
import 'package:stacked_themes/stacked_themes.dart';

class TopServicesWidget extends StatelessWidget {
  final services = [
    _TopServiceModel(
      icon: AssetPaths.loadMoney,
      label: TranslationStrings.loadMoney,
    ),
    _TopServiceModel(
      icon: AssetPaths.sendMoney,
      label: TranslationStrings.sendMoney,
    ),
    _TopServiceModel(
      icon: AssetPaths.bankTransfer,
      label: TranslationStrings.bankTransfer,
    ),
    _TopServiceModel(
        icon: AssetPaths.remittance, label: TranslationStrings.remittance),
  ];
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: locator<ThemeService>().isDarkMode
            ? Theme.of(context).canvasColor
            : Colors.white,
        borderRadius: BorderRadius.circular(dimen_8),
        boxShadow: getBoxShadow(context, opacity: 0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: services
            .map(
              (e) => Expanded(
                flex: 1,
                child: InkWell(
                  onTap: showNotImplementedToast,
                  borderRadius: BorderRadius.circular(dimen_8),
                  child: Container(
                    padding: mYPadding
                        .add(const EdgeInsets.symmetric(horizontal: dimen_4)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          e.icon,
                          height: dimen_18.h,
                        ),
                        xsHeightSpan,
                        AutoSizeText(
                          e.label.t(context),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          maxFontSize: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .fontSize
                              .ceilToDouble(),
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _TopServiceModel {
  final String label;
  final String icon;

  const _TopServiceModel({this.label, this.icon});
}
