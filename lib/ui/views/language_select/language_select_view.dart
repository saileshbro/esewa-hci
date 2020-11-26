import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/ui/screen_util.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:esewa_hci/common/ui/widgets/d_raised_button.dart';
import 'package:esewa_hci/common/ui/widgets/language_switch_button.dart';
import 'package:esewa_hci/models/language_model.dart';
import 'package:esewa_hci/ui/views/language_select/language_select_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:esewa_hci/common/extensions/extensions.dart';
import 'package:stacked_themes/stacked_themes.dart';

class LanguageSelectView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LanguageSelectViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => locator<LanguageSelectViewModel>(),
      builder: (
        BuildContext context,
        LanguageSelectViewModel model,
        Widget child,
      ) {
        return Scaffold(
          body: Padding(
            padding: sPagePadding,
            child: Column(
              children: [
                lHeightSpan,
                SizedBox(height: ScreenUtil.statusBarHeight),
                Image.asset(
                  locator<ThemeService>().isDarkMode
                      ? AssetPaths.esewaLogoDarkPath
                      : AssetPaths.esewaLogoLightPath,
                  width: ScreenUtil.screenWidth * 0.45,
                ),
                xlHeightSpan,
                mHeightSpan,
                LanguageSwitchButton(
                  label: "नेपाली भाषाको लागि यहाँ थिच्नुहोस्",
                  onPressed: () => model.setLanguageCode(
                      LanguageModel(countryCode: 'NP', languageCode: 'ne')),
                  isSelected: model.languageCode == 'ne',
                ),
                lHeightSpan,
                LanguageSwitchButton(
                  label: "Click to select English language",
                  onPressed: () => model.setLanguageCode(
                      LanguageModel(countryCode: 'US', languageCode: 'en')),
                  isSelected: model.languageCode == 'en',
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: DRaisedButton(
                    title: TranslationStrings.next.t(context),
                    loading: false,
                    hasBoxShadow: true,
                    disabled: !model.isLanguageSelected,
                    onPressed: model.onLanguageSelected,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
