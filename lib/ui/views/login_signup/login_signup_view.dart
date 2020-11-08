import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/ui/screen_util.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:esewa_hci/common/ui/widgets/d_outline_button.dart';
import 'package:esewa_hci/common/extensions/extensions.dart';
import 'package:esewa_hci/ui/views/login_signup/login_signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stacked/stacked.dart';

class LoginSignupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginSignupViewModel>.reactive(
      viewModelBuilder: () => locator<LoginSignupViewModel>(),
      builder: (
        BuildContext context,
        LoginSignupViewModel model,
        Widget child,
      ) {
        return Scaffold(
          body: Container(
            height: ScreenUtil.screenHeight,
            width: ScreenUtil.screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetPaths.girlDokoImage),
                fit: BoxFit.fitHeight,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.24), BlendMode.darken),
              ),
            ),
            child: Padding(
              padding: sPagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: ScreenUtil.statusBarHeight,
                  ),
                  Center(
                    child: Image.asset(
                      AssetPaths.esewaLogoPath,
                      width: ScreenUtil.screenWidth * 0.45,
                    ),
                  ),
                  Spacer(),
                  DOutlineButton(
                    title: TranslationStrings.signUp.t(context),
                    loading: false,
                    isExpanded: true,
                    fill: true,
                    onPressed: model.onSignupPressed,
                  ),
                  lHeightSpan,
                  DOutlineButton(
                    title: TranslationStrings.login.t(context),
                    loading: false,
                    isExpanded: true,
                    fill: true,
                    onPressed: model.onLoginPressed,
                  ),
                  xlHeightSpan,
                  GestureDetector(
                    onTap: model.onSkipPressed,
                    child: Text(
                      TranslationStrings.skip.t(context),
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.35,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
