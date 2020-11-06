import 'package:esewa_hci/models/language_model.dart';
import 'package:flutter/material.dart';

class Constants {
  Constants._();
  static const Color primaryGreen = Color(0xFF41A124);
  static const Color royalBlue = Color(0xFF604FEF);
  static const Color violet = Color(0xFFA74DBC);
  static const Color textFieldBackgroundColor = Color(0xFFF4F6FA);
  static const languages = [
    LanguageModel(code: 'np', value: 'नेपाली'),
    LanguageModel(code: 'en', value: 'English'),
  ];
}

class TranslationStrings {
  TranslationStrings._();
  static const String passwordMpinInvalid = "passwordMpinInvalid";
  static const String passwordMpinRequired = "passwordMpinRequired";
  static const String mobileEmailRequired = "mobileEmailRequired";
  static const String mobileEmailInvalid = "mobileEmailInvalid";
  static const String next = "next";
  static const String skip = "skip";
  static const String simpleAndFast = "simpleAndFast";
  static const String wayToRechargeYourMobile = "wayToRechargeYourMobile";
  static const String loadFund = "loadFund";
  static const String easierWayToLoadFund = "easierWayToLoadFund";
  static const String scanToPay = "scanToPay";
  static const String payAtYoutFav = "payAtYoutFav";
  static const String manyMore = "manyMore";
  static const String buyAirlines = "buyAirlines";
  static const String learnMore = "learnMore";
  static const String watchTheVideo = "watchTheVideo";
  static const String getStarted = "getStarted";
  static const String welcome = "welcome";
  static const String esewaRequired = "esewaRequired";
  static const String mobileNumber = "mobileNumber";
  static const String submit = "submit";
  static const String mobileRequired = "mobileRequired";
  static const String mobileInvalid = "mobileInvalid";
  static const String required = "required";
  static const String newDarkMode = "newDarkMode";
  static const String enjoyMoreVivid = "enjoyMoreVivid";
  static const String thisWayYouCan = "thisWayYouCan";
  static const String openSettings = "openSettings";
  static const String openAppearance = "openAppearance";
  static const String changeTheme = "changeTheme";
  static const String light = "light";
  static const String dark = "dark";
  static const String powerSaving = "powerSaving";
  static const String num0 = "0";
  static const String num1 = "1";
  static const String num2 = "2";
  static const String num3 = "3";
  static const String num4 = "4";
  static const String num5 = "5";
  static const String num6 = "6";
  static const String num7 = "7";
  static const String num8 = "8";
  static const String num9 = "9";
  static const String signUp = "signUp";
  static const String login = "login";
  static const String enterPhoneMpin = "enterPhoneMpin";
  static const String esewaIdMovileEmail = "esewaIdMovileEmail";
  static const String passwordMpin = "passwordMpin";
  static const String forgotPassword = "forgotPassword";
  static const String rememberMe = "rememberMe";
  static const String back = "back";
}

class AssetPaths {
  AssetPaths._();
  static const String esewaLogoPath = "assets/logos/esewa.png";
  static const String loadFundIllustration =
      "assets/illustrations/loadFund.png";
  static const String manyMoreIllustration =
      "assets/illustrations/manyMore.png";
  static const String scanToPayIllustration =
      "assets/illustrations/scanToPay.png";
  static const String simpleAndFastIllustration =
      "assets/illustrations/simpleAndFast.png";
  static const String themeSelectIllustration =
      "assets/illustrations/themeSelect.png";
  static const String girlDokoImage = "assets/images/girlDoko.jpeg";
}
