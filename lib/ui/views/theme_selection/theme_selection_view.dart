import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:esewa_hci/common/ui/widgets/d_floating_action_button.dart';
import 'package:esewa_hci/common/ui/widgets/d_raised_button.dart';
import 'package:esewa_hci/ui/views/theme_selection/theme_selection_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:esewa_hci/common/extensions/extensions.dart';

class ThemeSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThemeSelectionViewModel>.reactive(
      viewModelBuilder: () => locator<ThemeSelectionViewModel>(),
      builder: (
        BuildContext context,
        ThemeSelectionViewModel model,
        Widget child,
      ) {
        return Scaffold(
          floatingActionButton: DFloatingActionButton(
            onPressed: model.onCheckPressed,
            child: Icon(Icons.check),
            loading: model.isBusy,
          ),
          body: Padding(
            padding: sPagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: sPadding,
                  height: dimen_110.h,
                  width: double.infinity,
                  child: Image.asset(AssetPaths.themeSelectIllustration),
                ),
                Center(
                  child: Text(
                    TranslationStrings.newDarkMode.t(context),
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                ),
                mHeightSpan,
                Text(
                  TranslationStrings.enjoyMoreVivid.t(context),
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                llHeightSpan,
                Text(
                  TranslationStrings.thisWayYouCan.t(context),
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Colors.black,
                      ),
                ),
                lHeightSpan,
                _Listtile(
                  number: TranslationStrings.num1.t(context),
                  icon: Icons.settings,
                  label: TranslationStrings.openSettings.t(context),
                ),
                _Listtile(
                  number: TranslationStrings.num2.t(context),
                  icon: Icons.brush,
                  label: TranslationStrings.openAppearance.t(context),
                ),
                _Listtile(
                  number: TranslationStrings.num3.t(context),
                  label: TranslationStrings.changeTheme.t(context),
                ),
                lHeightSpan,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DRaisedButton(
                      title: TranslationStrings.light.t(context),
                      loading: false,
                      onPressed: () => model.toggleTheme(AppThemeMode.light),
                      hasBoxShadow: model.themeMode == AppThemeMode.light,
                      color: model.themeMode == AppThemeMode.light
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).disabledColor,
                    ),
                    DRaisedButton(
                      title: TranslationStrings.dark.t(context),
                      loading: false,
                      onPressed: () => model.toggleTheme(AppThemeMode.dark),
                      hasBoxShadow: model.themeMode == AppThemeMode.dark,
                      color: model.themeMode == AppThemeMode.dark
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).disabledColor,
                    ),
                    DRaisedButton(
                      title: TranslationStrings.powerSaving.t(context),
                      loading: false,
                      onPressed: () =>
                          model.toggleTheme(AppThemeMode.powerSaving),
                      hasBoxShadow: model.themeMode == AppThemeMode.powerSaving,
                      color: model.themeMode == AppThemeMode.powerSaving
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).disabledColor,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Listtile extends StatelessWidget {
  final String number;
  final IconData icon;
  final String label;

  const _Listtile({Key key, this.number, this.icon, this.label})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: mXPadding,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "$number.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
              xsWidthSpan,
              if (icon != null) ...[
                Icon(
                  icon,
                  size: dimen_24.w,
                ),
                xsWidthSpan
              ],
              Text(
                label,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
            ],
          ),
          sHeightSpan,
        ],
      ),
    );
  }
}
