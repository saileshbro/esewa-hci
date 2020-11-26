import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/app_localizations.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/ui/screen_util.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:esewa_hci/common/extensions/extensions.dart';
import 'package:esewa_hci/common/ui/widgets/d_raised_button.dart';
import 'package:esewa_hci/common/ui/widgets/list_tile_button.dart';
import 'package:esewa_hci/ui/views/auth_welcome/auth_welcome_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AuthWelcomeView extends StatelessWidget {
  final String userFirstName;

  const AuthWelcomeView({Key key, @required this.userFirstName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthWelcomeViewModel>.nonReactive(
      disposeViewModel: false,
      viewModelBuilder: () => locator<AuthWelcomeViewModel>(),
      builder: (
        BuildContext context,
        AuthWelcomeViewModel model,
        Widget child,
      ) {
        return Scaffold(
          body: Padding(
            padding: sPagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ScreenUtil.statusBarHeight,
                ),
                Center(
                  child: Image.asset(
                    AssetPaths.eWalletIcon,
                    width: ScreenUtil.screenWidth * 0.25,
                  ),
                ),
                AutoSizeText(
                  TranslationStrings.dynDear.t(context, args: [
                    AppLocalizations.of(context).locale.languageCode == 'ne'
                        ? "प्रयोगकर्ता"
                        : "User"
                  ]),
                  maxFontSize: Theme.of(context)
                      .textTheme
                      .headline4
                      .fontSize
                      .ceilToDouble(),
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                sHeightSpan,
                Text(
                  TranslationStrings.loadMoneyIn.t(context),
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                llHeightSpan,
                ListTileButton(
                  icon: Icon(
                    Icons.location_on,
                    size: dimen_34.w,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: model.onCashPointsPressed,
                  title: TranslationStrings.eSewaCashPoints.t(context),
                  subtitle: TranslationStrings.findTheNearest.t(context),
                ),
                llHeightSpan,
                ListTileButton(
                  icon: Icon(
                    Icons.home_work,
                    size: dimen_34.w,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: model.onBankAccountPressed,
                  title: TranslationStrings.bankAccount.t(context),
                  subtitle: TranslationStrings.youCanUseMobile.t(context),
                ),
                xlHeightSpan,
                EasyRichText(
                  TranslationStrings.loadYourEsewa.t(context),
                  defaultStyle: Theme.of(context).textTheme.subtitle1,
                  patternList: [
                    EasyRichTextPattern(
                      targetString: r"\{(.*)\}",
                      hasSpecialCharacters: false,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                Spacer(),
                DRaisedButton(
                  title: TranslationStrings.skip.t(context),
                  isExpanded: true,
                  onPressed: model.onSkipPressed,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
