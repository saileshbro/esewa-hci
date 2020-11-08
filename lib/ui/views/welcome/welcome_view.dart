import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/common/constants.dart';

import 'package:esewa_hci/common/ui/screen_util.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:esewa_hci/common/ui/widgets/d_raised_button.dart';
import 'package:esewa_hci/common/ui/widgets/d_text_field.dart';
import 'package:esewa_hci/common/ui/widgets/required_fields_banner.dart';
import 'package:esewa_hci/ui/views/welcome/welcome_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:esewa_hci/common/extensions/extensions.dart';

class WelcomeView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeViewModel>.reactive(
      viewModelBuilder: () => locator<WelcomeViewModel>(),
      builder: (
        BuildContext context,
        WelcomeViewModel model,
        Widget child,
      ) {
        return Scaffold(
          body: Padding(
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
                  lHeightSpan,
                  Text(
                    TranslationStrings.welcome.t(context),
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  sHeightSpan,
                  Text(
                    TranslationStrings.esewaRequired.t(context),
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  lHeightSpan,
                  DTextField(
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
                  Spacer(),
                  RequiredFieldsBanner(),
                  DRaisedButton(
                    title: TranslationStrings.submit.t(context),
                    loading: model.isBusy,
                    isExpanded: true,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        model.onSubmitPressed();
                      }
                    },
                    disabled: model.phone.isEmpty,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
