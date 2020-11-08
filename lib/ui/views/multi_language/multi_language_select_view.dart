import 'package:auto_size_text/auto_size_text.dart';
import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/app_localizations.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/ui/screen_util.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:esewa_hci/ui/views/multi_language/multi_language_select_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MultiLanguageSelectView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MultiLanguageSelectViewModel>.reactive(
      disposeViewModel: false,
      onModelReady: (model) =>
          model.init(AppLocalizations.of(context).locale.languageCode),
      fireOnModelReadyOnce: false,
      viewModelBuilder: () => locator<MultiLanguageSelectViewModel>(),
      builder: (
        BuildContext context,
        MultiLanguageSelectViewModel model,
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
                TranslationStrings.selectLanguage.t(context),
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
              _RadioTile(
                groupValue: model.languageCode,
                value: 'np',
                label: "नेपाली",
                onChanged: model.toggleLanguageCode,
              ),
              _RadioTile(
                groupValue: model.languageCode,
                value: 'en',
                label: "English",
                onChanged: model.toggleLanguageCode,
              ),
              _RadioTile(
                groupValue: model.languageCode,
                value: 'hi',
                label: "हिन्दी",
                onChanged: model.toggleLanguageCode,
              ),
              _RadioTile(
                groupValue: model.languageCode,
                value: 'mt',
                label: "मैथिली",
                onChanged: model.toggleLanguageCode,
              ),
              _RadioTile(
                groupValue: model.languageCode,
                value: 'bg',
                label: "বাংলা",
                onChanged: model.toggleLanguageCode,
              ),
              _RadioTile(
                groupValue: model.languageCode,
                value: 'nb',
                label: "नेवाः भाय्",
                onChanged: model.toggleLanguageCode,
              ),
              _RadioTile(
                groupValue: model.languageCode,
                value: 'bj',
                label: "भोजपुरी",
                onChanged: model.toggleLanguageCode,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _RadioTile extends StatelessWidget {
  final String groupValue;
  final String value;
  final Function(String) onChanged;
  final String label;
  const _RadioTile({
    Key key,
    @required this.groupValue,
    @required this.value,
    @required this.onChanged,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: Theme.of(context).primaryColor,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: Colors.black,
              ),
        ),
      ],
    );
  }
}
