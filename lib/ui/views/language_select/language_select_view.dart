import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/ui/screen_util.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:esewa_hci/common/ui/widgets/d_raised_button.dart';
import 'package:esewa_hci/common/ui/widgets/language_switch_button.dart';
import 'package:esewa_hci/models/language_model.dart';
import 'package:esewa_hci/ui/blocs/language_bloc/language_bloc.dart';
import 'package:esewa_hci/ui/views/language_select/language_select_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:esewa_hci/common/extensions/extensions.dart';

class LanguageSelectView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LanguageSelectViewModel>.nonReactive(
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
                  AssetPaths.esewaLogoPath,
                  width: double.infinity,
                ),
                xlHeightSpan,
                mHeightSpan,
                LanguageSwitchButton(
                  label: "नेपाली भाषाको लागि यहाँ थिच्नुहोस्",
                  onPressed: () {
                    model.setLanguageCode("np");
                    context
                        .bloc<LanguageBloc>()
                        .add(ToggleLanguageEvent(LanguageModel(code: 'np')));
                  },
                  isSelected: model.isLanguage("np"),
                ),
                lHeightSpan,
                LanguageSwitchButton(
                  label: "Click to select English language",
                  onPressed: () {
                    model.setLanguageCode("en");
                    context
                        .bloc<LanguageBloc>()
                        .add(ToggleLanguageEvent(LanguageModel(code: 'en')));
                  },
                  isSelected: model.isLanguage("en"),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: DRaisedButton(
                    title: TranslationStrings.next.t(context),
                    loading: false,
                    hasBoxShadow: true,
                    disabled: !model.isLanguageSelected,
                    onPressed: () {},
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
