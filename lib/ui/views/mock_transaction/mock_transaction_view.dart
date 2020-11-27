import 'package:auto_size_text/auto_size_text.dart';
import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/helpers/show_custom_toast.dart';
import 'package:esewa_hci/common/ui/screen_util.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:esewa_hci/common/ui/widgets/d_raised_button.dart';
import 'package:esewa_hci/common/ui/widgets/home_stats_widget.dart';
import 'package:esewa_hci/common/ui/widgets/required_fields_banner.dart';
import 'package:esewa_hci/services/language_service.dart';
import 'package:esewa_hci/ui/views/mock_transaction/mock_transaction_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

class MockTransactionView extends StatelessWidget {
  static const Map<String, Map<String, String>> _fieldsMap = {
    "en_US": {
      "Username": "saileshbro",
      "Customer Name": "Sailesh Dahal",
      "Plan": "Supereme 20MBPS",
      "Amount": "NPR 2013.00",
      "Total Paying Amount": "NPR 2013.00"
    },
    "ne_NP": {
      "प्रयोगकर्ता नाम": "saileshbro",
      "ग्राहकको नाम": "Sailesh Dahal",
      "योजना": "सर्वोच्च २०MBPS",
      "रकम": "NPR २०१.००",
      "कुल भुक्तानी रकम": "NPR २०१.००"
    }
  };
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    print(locator<LanguageService>().locale.toString());
    return ViewModelBuilder<MockTransactionViewModel>.reactive(
      viewModelBuilder: () => locator<MockTransactionViewModel>(),
      builder: (
        BuildContext context,
        MockTransactionViewModel model,
        Widget child,
      ) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Localizations.override(
              context: context,
              locale: Locale('en'),
              child: AppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                centerTitle: true,
                title: Image.asset(
                  locator<ThemeService>().isDarkMode
                      ? AssetPaths.esewaLogoDarkPath
                      : AssetPaths.esewaLogoLightPath,
                  width: ScreenUtil.screenWidth * 0.35,
                ),
              ),
            ),
          ),
          body: Padding(
            padding: sPagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  TranslationStrings.mockTransaction.t(context),
                  maxLines: 1,
                  maxFontSize: Theme.of(context)
                      .textTheme
                      .headline4
                      .fontSize
                      .ceilToDouble(),
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                sHeightSpan,
                HomeStatsWidget(
                  balance: 500,
                  rewardPoints: 3000,
                ),
                llHeightSpan,
                Container(
                  padding: mXPadding.add(sYPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(dimen_8),
                    boxShadow: getBoxShadow(context, opacity: 0.2),
                    color: locator<ThemeService>().isDarkMode
                        ? Theme.of(context).canvasColor
                        : Colors.white,
                  ),
                  child: Column(
                    children:
                        _fieldsMap[locator<LanguageService>().locale.toString()]
                            .entries
                            .map(
                              (e) => Padding(
                                padding: sYPadding,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      e.key,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                      maxFontSize: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          .fontSize
                                          .ceilToDouble(),
                                    ),
                                    AutoSizeText(
                                      e.value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          .copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                      maxFontSize: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          .fontSize
                                          .ceilToDouble(),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ),
                Spacer(),
                RequiredFieldsBanner(
                  requiredField: TranslationStrings.thisIsAMockTransaction,
                ),
                DRaisedButton(
                  title: TranslationStrings.clickToPay.t(context),
                  onPressed: () {
                    _scaffoldKey.currentState
                        .showSnackBar(SnackBar(
                          action: SnackBarAction(
                            label: TranslationStrings.cancel.t(context),
                            onPressed: () {
                              showCustomToast(
                                  message:
                                      TranslationStrings.cancelled.t(context));
                              model.cancelled();
                            },
                          ),
                          content: Padding(
                            padding: sXPadding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  TranslationStrings.transactionIsBeing
                                      .t(context),
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
                                ),
                                CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Theme.of(context).primaryColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          margin: sPadding,
                          behavior: SnackBarBehavior.floating,
                        ))
                        .closed
                        .then((value) {
                      if (model.showCompletion()) {
                        showCustomToast(
                            message:
                                TranslationStrings.transSuccessful.t(context));
                      }
                    });
                  },
                  isExpanded: true,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
