import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/ui/screen_util.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:esewa_hci/ui/views/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      onModelReady: (StartUpViewModel model) => model.handleStartupViewLogic(),
      builder: (BuildContext context, StartUpViewModel model, Widget child) =>
          Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                locator<ThemeService>().isDarkMode
                    ? AssetPaths.esewaLogoDarkPath
                    : AssetPaths.esewaLogoLightPath,
                width: ScreenUtil.screenWidth * 0.55,
              ),
              llHeightSpan,
              CircularProgressIndicator(
                strokeWidth: 4.w,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
      ),
      disposeViewModel: false,
      viewModelBuilder: () => locator<StartUpViewModel>(),
    );
  }
}
