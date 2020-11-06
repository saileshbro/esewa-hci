import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:esewa_hci/ui/views/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      onModelReady: (StartUpViewModel model) => model.handleStartupViewLogic(),
      builder: (BuildContext context, StartUpViewModel model, Widget child) =>
          Scaffold(
        body: Padding(
          padding: sPagePadding,
          child: Center(
            child: Image.asset(
              AssetPaths.esewaLogoPath,
              width: double.infinity,
            ),
          ),
        ),
      ),
      viewModelBuilder: () => locator<StartUpViewModel>(),
    );
  }
}
