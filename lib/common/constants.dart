import 'package:esewa_hci/models/language_model.dart';
import 'package:flutter/material.dart';

class Constants {
  Constants._();
  static const Color primaryGreenLight = Color(0xFF41A124);
  static const Color primaryGreenDark = Color(0xFF96DD81);
  static const Color backgroundColorLight = Colors.white;
  static const Color backgroundColorDark = Color(0xff121212);
  static const Color textFieldBackgroundColorLight = Color(0xFFF4F6FA);
  static const Color textFieldBackgroundColorDark = Color(0xFF222222);
  static const languages = [
    LanguageModel(languageCode: 'en', countryCode: 'US'),
    LanguageModel(languageCode: 'ne', countryCode: 'NP'),
  ];
}

class TranslationStrings {
  TranslationStrings._();
  static const String thisIsAMockTransaction = "thisIsAMockTransaction";
  static const String clickToPay = "clickToPay";
  static const String passwordMpinInvalid = "passwordMpinInvalid";
  static const String allCategories = "allCategories";
  static const String passwordMpinRequired = "passwordMpinRequired";
  static const String mobileEmailRequired = "mobileEmailRequired";
  static const String yourMobileNumberWill = "yourMobileNumberWill";
  static const String fullName = "fullName";
  static const String tac = "tac";
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
  static const String proceed = "proceed";
  static const String num9 = "9";
  static const String signUp = "signUp";
  static const String login = "login";
  static const String enterPhoneMpin = "enterPhoneMpin";
  static const String esewaIdMovileEmail = "esewaIdMovileEmail";
  static const String passwordMpin = "passwordMpin";
  static const String forgotPassword = "forgotPassword";
  static const String rememberMe = "rememberMe";
  static const String back = "back";
  static const String select = "select";
  static const String gender = "gender";
  static const String male = "male";
  static const String female = "female";
  static const String others = "others";
  static const String fullNameRequired = "fullNameRequired";
  static const String fullNameInvalid = "fullNameInvalid";
  static const String dynDear = "dynDear";
  static const String loadMoneyIn = "loadMoneyIn";
  static const String eSewaCashPoints = "eSewaCashPoints";
  static const String findTheNearest = "findTheNearest";
  static const String bankAccount = "bankAccount";
  static const String youCanUseMobile = "youCanUseMobile";
  static const String loadYourEsewa = "loadYourEsewa";
  static const String dynNPR = "dynNPR";
  static const String balance = "balance";
  static const String rewardPoints = "rewardPoints";
  static const String topServices = "topServices";
  static const String otherServices = "otherServices";
  static const String home = "home";
  static const String statement = "statement";
  static const String scanAndPay = "scanAndPay";
  static const String myPayment = "myPayment";
  static const String offers = "offers";
  static const String loadMoney = "loadMoney";
  static const String sendMoney = "sendMoney";
  static const String bankTransfer = "bankTransfer";
  static const String remittance = "remittance";
  static const String tv = "tv";
  static const String schoolFee = "schoolFee";
  static const String topUp = "topUp";
  static const String electricity = "electricity";
  static const String drinkingWater = "drinkingWater";
  static const String internet = "internet";
  static const String airlines = "airlines";
  static const String scan = "scan";
  static const String settings = "settings";
  static const String general = "general";
  static const String appearance = "appearance";
  static const String chooseYourLight = "chooseYourLight";
  static const String appNotification = "appNotification";
  static const String security = "security";
  static const String changeMPIN = "changeMPIN";
  static const String changeYour = "changeYour";
  static const String resetMPIN = "resetMPIN";
  static const String resetYour = "resetYour";
  static const String useFingerprint = "useFingerprint";
  static const String setFingerprint = "setFingerprint";
  static const String app = "app";
  static const String checkForUpdate = "checkForUpdate";
  static const String version = "version";
  static const String aboutUs = "aboutUs";
  static const String knowAbouteSewa = "knowAbouteSewa";
  static const String language = "language";
  static const String selectLanguage = "selectLanguage";
  static const String turnOffAll = "turnOffAll";
  static const String loginSuccessful = "loginSuccessful";
  static const String signupSuccessful = "signupSuccessful";
  static const String cashback = "cashback";
  static const String cashbackIsShown = "cashbackIsShown";
  static const String systemDefault = "systemDefault";
  static const String mockTransaction = "mockTransaction";
  static const String transactionIsBeing = "transactionIsBeing";
  static const String cancel = "cancel";
  static const String cancelled = "cancelled";
  static const String transSuccessful = "transSuccessful";
}

class AssetPaths {
  AssetPaths._();
  static const String esewaLogoLightPath = "assets/logos/esewa-light.png";
  static const String esewaLogoDarkPath = "assets/logos/esewa-dark.png";

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
  static const String eWalletIcon = "assets/icons/eWalletIcon.png";
  static const String airlines = "assets/icons/airlines.png";
  static const String bankTransfer = "assets/icons/bankTransfer.png";
  static const String cooperativeWithdraw =
      "assets/icons/cooperativeWithdraw.png";
  static const String drinkingWater = "assets/icons/drinkingWater.png";
  static const String electricity = "assets/icons/electricity.png";
  static const String home = "assets/icons/home.png";
  static const String internet = "assets/icons/internet.png";
  static const String loadMoney = "assets/icons/loadMoney.png";
  static const String myPayment = "assets/icons/myPayment.png";
  static const String npr = "assets/icons/npr.png";
  static const String offers = "assets/icons/offers.png";
  static const String remittance = "assets/icons/remittance.png";
  static const String reward = "assets/icons/reward.png";
  static const String scan = "assets/icons/scan.png";
  static const String schoolFee = "assets/icons/schoolFee.png";
  static const String sendMoney = "assets/icons/sendMoney.png";
  static const String statement = "assets/icons/statement.png";
  static const String topUp = "assets/icons/topUp.png";
  static const String tv = "assets/icons/tv.png";
  static const String aboutUs = "assets/icons/aboutUs.png";
  static const String appNotification = "assets/icons/appNotification.png";
  static const String appearance = "assets/icons/appearance.png";
  static const String changeMPIN = "assets/icons/changeMPIN.png";
  static const String checkUpdate = "assets/icons/checkUpdate.png";
  static const String resetMPIN = "assets/icons/resetMPIN.png";
  static const String useFingerprint = "assets/icons/useFingerprint.png";
}
