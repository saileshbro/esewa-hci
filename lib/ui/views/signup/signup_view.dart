import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/ui/screen_util.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:esewa_hci/common/extensions/extensions.dart';
import 'package:esewa_hci/common/ui/widgets/d_dropdown_menu.dart';
import 'package:esewa_hci/common/ui/widgets/d_raised_button.dart';
import 'package:esewa_hci/common/ui/widgets/d_text_field.dart';
import 'package:esewa_hci/common/ui/widgets/required_fields_banner.dart';
import 'package:esewa_hci/ui/views/signup/signup_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode fullNameFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => locator<SignupViewModel>(),
      builder: (
        BuildContext context,
        SignupViewModel model,
        Widget child,
      ) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height +
                  2 * ScreenUtil.statusBarHeight,
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
                        AssetPaths.esewaLogoPath,
                        width: ScreenUtil.screenWidth * 0.45,
                      ),
                      sHeightSpan,
                      Text(
                        TranslationStrings.signUp.t(context),
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                      sHeightSpan,
                      Text(
                        TranslationStrings.yourMobileNumberWill.t(context),
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      sHeightSpan,
                      DTextField(
                        focusNode: phoneFocusNode,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(fullNameFocusNode),
                        label: TranslationStrings.mobileNumber.t(context),
                        hintText: TranslationStrings.mobileNumber.t(context),
                        required: true,
                        textInputType: TextInputType.phone,
                        onChanged: model.onPhoneChanged,
                        enabled: !model.isBusy,
                        validator: (value) {
                          if (value.isEmpty) {
                            return TranslationStrings.mobileRequired.t(context);
                          }
                          if (!model.isPhoneValid) {
                            return TranslationStrings.mobileInvalid.t(context);
                          }
                          return null;
                        },
                      ),
                      sHeightSpan,
                      DTextField(
                        focusNode: fullNameFocusNode,
                        onEditingComplete: () =>
                            FocusScope.of(context).requestFocus(FocusNode()),
                        label: TranslationStrings.fullName.t(context),
                        hintText: TranslationStrings.fullName.t(context),
                        required: true,
                        textCapitalization: TextCapitalization.words,
                        onChanged: model.onNameChanged,
                        enabled: !model.isBusy,
                        validator: (value) {
                          if (value.isEmpty) {
                            return TranslationStrings.fullNameRequired
                                .t(context);
                          }
                          if (!model.isNameValid) {
                            return TranslationStrings.fullNameInvalid
                                .t(context);
                          }
                          return null;
                        },
                      ),
                      sHeightSpan,
                      DDropDownMenu(
                        placeHolder: model.gender.isEmpty
                            ? TranslationStrings.select.t(context)
                            : model.gender.t(context),
                        label: TranslationStrings.gender.t(context),
                        isRequired: true,
                        enabled: !model.isBusy,
                        onSelected: model.onGenderChanged,
                        items: [
                          TranslationStrings.male,
                          TranslationStrings.female,
                          TranslationStrings.others,
                        ],
                      ),
                      mHeightSpan,
                      Row(
                        children: [
                          Checkbox(
                            value: model.isAgreed,
                            onChanged: model.toggleAgree,
                            activeColor: Theme.of(context).primaryColor,
                          ),
                          Flexible(
                            child: EasyRichText(
                              TranslationStrings.tac.t(context),
                              defaultStyle:
                                  Theme.of(context).textTheme.bodyText2,
                              patternList: [
                                EasyRichTextPattern(
                                  targetString: r"\[(.*)\]",
                                  hasSpecialCharacters: false,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print("TOC");
                                    },
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                EasyRichTextPattern(
                                  targetString: r"\{(.*)\}",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print("PP");
                                    },
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      RequiredFieldsBanner(),
                      DRaisedButton(
                          title: TranslationStrings.proceed.t(context),
                          loading: model.isBusy,
                          isExpanded: true,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              model.onSignupPressed();
                            }
                          },
                          disabled: !(model.phone.isNotEmpty &&
                              model.name.isNotEmpty &&
                              model.gender.isNotEmpty &&
                              model.isAgreed)),
                      lHeightSpan,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: model.onLoginPressed,
                            child: Text(
                              TranslationStrings.login.t(context),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
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
              ),
            ),
          ),
        );
      },
    );
  }
}
