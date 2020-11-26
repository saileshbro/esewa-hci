import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/helpers/show_custom_toast.dart';
import 'package:esewa_hci/common/ui/screen_util.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:esewa_hci/common/extensions/extensions.dart';
import 'package:esewa_hci/common/ui/widgets/d_raised_button.dart';
import 'package:esewa_hci/common/ui/widgets/d_text_field.dart';
import 'package:esewa_hci/common/ui/widgets/required_fields_banner.dart';
import 'package:esewa_hci/ui/views/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

class LoginView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => locator<LoginViewModel>(),
      builder: (
        BuildContext context,
        LoginViewModel model,
        Widget child,
      ) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height -
                  kBottomNavigationBarHeight -
                  dimen_20,
              child: Padding(
                padding: sPagePadding,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: ScreenUtil.statusBarHeight,
                      ),
                      Image.asset(
                        locator<ThemeService>().isDarkMode
                            ? AssetPaths.esewaLogoDarkPath
                            : AssetPaths.esewaLogoLightPath,
                        width: ScreenUtil.screenWidth * 0.45,
                      ),
                      sHeightSpan,
                      Text(
                        TranslationStrings.login.t(context),
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      sHeightSpan,
                      Text(
                        TranslationStrings.enterPhoneMpin.t(context),
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      mHeightSpan,
                      DTextField(
                        focusNode: phoneFocusNode,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(passwordFocusNode),
                        label: TranslationStrings.esewaIdMovileEmail.t(context),
                        hintText:
                            TranslationStrings.esewaIdMovileEmail.t(context),
                        required: true,
                        onChanged: model.onPhoneChanged,
                        enabled: !model.isBusy,
                        validator: (value) {
                          if (value.isEmpty) {
                            return TranslationStrings.mobileEmailRequired
                                .t(context);
                          }
                          if (!model.isPhoneValid) {
                            return TranslationStrings.mobileEmailInvalid
                                .t(context);
                          }
                          return null;
                        },
                      ),
                      sHeightSpan,
                      DTextField(
                        focusNode: passwordFocusNode,
                        onEditingComplete: () =>
                            FocusScope.of(context).requestFocus(FocusNode()),
                        label: TranslationStrings.passwordMpin.t(context),
                        hintText: TranslationStrings.passwordMpin.t(context),
                        required: true,
                        password: true,
                        onChanged: model.onPasswordChanged,
                        enabled: !model.isBusy,
                        validator: (value) {
                          if (value.isEmpty) {
                            return TranslationStrings.passwordMpinRequired
                                .t(context);
                          }
                          if (!model.isPasswordValid) {
                            return TranslationStrings.passwordMpinInvalid
                                .t(context);
                          }
                          return null;
                        },
                      ),
                      lHeightSpan,
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: model.forgotPasswordPressed,
                          child: Text(
                            TranslationStrings.forgotPassword.t(context),
                            style:
                                Theme.of(context).textTheme.subtitle2.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                      decoration: TextDecoration.underline,
                                    ),
                          ),
                        ),
                      ),
                      sHeightSpan,
                      Row(
                        children: [
                          Checkbox(
                            value: model.rememberMe,
                            onChanged: model.toggleRememberMe,
                            activeColor: Theme.of(context).primaryColor,
                          ),
                          Text(
                            TranslationStrings.rememberMe.t(context),
                            style: Theme.of(context).textTheme.bodyText2,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: sPagePadding.add(const EdgeInsets.only(bottom: dimen_8)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RequiredFieldsBanner(),
                DRaisedButton(
                  title: TranslationStrings.login.t(context),
                  loading: model.isBusy,
                  isExpanded: true,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      model.onLoginPressed().then((value) => showCustomToast(
                          message:
                              TranslationStrings.loginSuccessful.t(context)));
                    }
                  },
                  disabled: model.emailOrPhone.isEmpty ||
                      model.passwordOrMPIN.isEmpty,
                ),
                lHeightSpan,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: model.onSignupPressed,
                      child: Text(
                        TranslationStrings.signUp.t(context),
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.35,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                    GestureDetector(
                      onTap: locator<NavigationService>().back,
                      child: Text(
                        TranslationStrings.back.t(context),
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.35,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
