import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/ui/views/signup/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      viewModelBuilder: () => locator<SignupViewModel>(),
      disposeViewModel: false,
      builder: (
        BuildContext context,
        SignupViewModel model,
        Widget child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'SignupView',
            ),
          ),
        );
      },
    );
  }
}
