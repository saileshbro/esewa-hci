import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:esewa_hci/common/ui/widgets/d_floating_action_button.dart';
import 'package:esewa_hci/common/ui/widgets/d_raised_button.dart';
import 'package:esewa_hci/ui/views/theme_selection/theme_selection_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:esewa_hci/common/extensions/extensions.dart';
import 'package:stacked_themes/stacked_themes.dart';

class ThemeSelectionView extends StatelessWidget {
  final Function onThemeChanged;

  const ThemeSelectionView({Key key, @required this.onThemeChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThemeSelectionViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => locator<ThemeSelectionViewModel>(),
      builder: (
        BuildContext context,
        ThemeSelectionViewModel model,
        Widget child,
      ) {
        return Scaffold(
          floatingActionButton: DFloatingActionButton(
            onPressed: () async {
              await model.onCheckPressed();
              onThemeChanged?.call();
            },
            child: Icon(Icons.check),
            loading: model.isBusy,
          ),
          body: ListView(
            padding: sPagePadding.add(EdgeInsets.only(bottom: dimen_64)),
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
                      ),
                ),
              ),
              mHeightSpan,
              Text(
                TranslationStrings.enjoyMoreVivid.t(context),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              llHeightSpan,
              Text(
                TranslationStrings.thisWayYouCan.t(context),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.subtitle1,
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
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: dimen_24,
                children: [
                  DRaisedButton(
                    title: TranslationStrings.light.t(context),
                    loading: false,
                    onPressed: () => model.toggleTheme(ThemeManagerMode.light),
                    hasBoxShadow: model.themeMode == ThemeManagerMode.light,
                    color: model.themeMode == ThemeManagerMode.light
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).disabledColor,
                  ),
                  DRaisedButton(
                    title: TranslationStrings.dark.t(context),
                    loading: false,
                    onPressed: () => model.toggleTheme(ThemeManagerMode.dark),
                    hasBoxShadow: model.themeMode == ThemeManagerMode.dark,
                    color: model.themeMode == ThemeManagerMode.dark
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).disabledColor,
                  ),
                  DRaisedButton(
                    title: TranslationStrings.systemDefault.t(context),
                    loading: false,
                    onPressed: () => model.toggleTheme(ThemeManagerMode.system),
                    hasBoxShadow: model.themeMode == ThemeManagerMode.system,
                    color: model.themeMode == ThemeManagerMode.system
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).disabledColor,
                  ),
                ],
              )
            ],
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
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          sHeightSpan,
        ],
      ),
    );
  }
}
