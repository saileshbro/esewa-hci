import 'package:auto_size_text/auto_size_text.dart';
import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/ui/screen_util.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:esewa_hci/common/ui/widgets/list_tile_button.dart';
import 'package:esewa_hci/ui/views/settings/settings_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.nonReactive(
      disposeViewModel: false,
      viewModelBuilder: () => locator<SettingsViewModel>(),
      builder: (
        BuildContext context,
        SettingsViewModel model,
        Widget child,
      ) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Localizations.override(
              context: context,
              locale: Locale('en'),
              child: AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Image.asset(
                  AssetPaths.esewaLogoPath,
                  width: ScreenUtil.screenWidth * 0.35,
                ),
              ),
            ),
          ),
          body: ListView(
            padding: sPagePadding,
            children: [
              AutoSizeText(
                TranslationStrings.settings.t(context),
                maxLines: 1,
                maxFontSize: Theme.of(context)
                    .textTheme
                    .headline4
                    .fontSize
                    .ceilToDouble(),
                style: Theme.of(context).textTheme.headline4.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
              mHeightSpan,
              Text(
                TranslationStrings.general.t(context),
                style: Theme.of(context).textTheme.headline6,
              ),
              mHeightSpan,
              ListTileButton(
                hasArrow: true,
                icon: Image.asset(
                  AssetPaths.appearance,
                  height: dimen_18.h,
                ),
                onPressed: () {},
                title: TranslationStrings.appearance.t(context),
                subtitle: TranslationStrings.chooseYourLight.t(context),
              ),
              sHeightSpan,
              xsHeightSpan,
              ListTileButton(
                hasArrow: true,
                icon: Image.asset(
                  AssetPaths.changeMPIN,
                  height: dimen_18.h,
                ),
                onPressed: model.onChangeLanguagePressed,
                title: TranslationStrings.language.t(context),
                subtitle: TranslationStrings.selectLanguage.t(context),
              ),
              sHeightSpan,
              xsHeightSpan,
              ListTileButton(
                hasArrow: true,
                icon: Image.asset(
                  AssetPaths.appNotification,
                  height: dimen_18.h,
                ),
                onPressed: () {},
                title: TranslationStrings.appNotification.t(context),
                subtitle: TranslationStrings.turnOffAll.t(context),
              ),
              lHeightSpan,
              Text(
                TranslationStrings.security.t(context),
                style: Theme.of(context).textTheme.headline6,
              ),
              mHeightSpan,
              ListTileButton(
                hasArrow: true,
                icon: Image.asset(
                  AssetPaths.changeMPIN,
                  height: dimen_18.h,
                ),
                onPressed: () {},
                title: TranslationStrings.changeMPIN.t(context),
                subtitle: TranslationStrings.changeYour.t(context),
              ),
              sHeightSpan,
              xsHeightSpan,
              ListTileButton(
                hasArrow: true,
                icon: Image.asset(
                  AssetPaths.resetMPIN,
                  height: dimen_18.h,
                ),
                onPressed: () {},
                title: TranslationStrings.resetMPIN.t(context),
                subtitle: TranslationStrings.resetYour.t(context),
              ),
              sHeightSpan,
              xsHeightSpan,
              ListTileButton(
                hasArrow: true,
                icon: Image.asset(
                  AssetPaths.useFingerprint,
                  height: dimen_18.h,
                ),
                onPressed: () {},
                title: TranslationStrings.useFingerprint.t(context),
                subtitle: TranslationStrings.setFingerprint.t(context),
              ),
              lHeightSpan,
              Text(
                TranslationStrings.app.t(context),
                style: Theme.of(context).textTheme.headline6,
              ),
              mHeightSpan,
              ListTileButton(
                hasArrow: true,
                icon: Image.asset(
                  AssetPaths.checkUpdate,
                  height: dimen_18.h,
                ),
                onPressed: () {},
                title: TranslationStrings.checkForUpdate.t(context),
                subtitle: TranslationStrings.version.t(context),
              ),
              sHeightSpan,
              xsHeightSpan,
              ListTileButton(
                hasArrow: true,
                icon: Image.asset(
                  AssetPaths.aboutUs,
                  height: dimen_18.h,
                ),
                onPressed: () {},
                title: TranslationStrings.aboutUs.t(context),
                subtitle: TranslationStrings.knowAbouteSewa.t(context),
              ),
              mHeightSpan,
            ],
          ),
        );
      },
    );
  }
}
