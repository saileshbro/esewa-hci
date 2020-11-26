import 'package:esewa_hci/common/ui/theme/theme_setup.dart';
import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:esewa_hci/language_view_model.dart';
import 'package:esewa_hci/setup_snackbar.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/app/router.gr.dart';
import 'package:esewa_hci/app_localizations.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/ui/screen_util.dart';
import 'package:stacked_themes/stacked_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await ThemeManager.initialise();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return OKToast(
      duration: Duration(seconds: 3),
      position: ToastPosition.bottom,
      radius: dimen_16,
      textPadding: sPadding,
      child: ViewModelBuilder<LanguageViewModel>.reactive(
        viewModelBuilder: () => locator<LanguageViewModel>(),
        builder: (BuildContext context, LanguageViewModel model, Widget child) {
          return ThemeBuilder(
            defaultThemeMode: ThemeMode.light,
            lightTheme: kLightThemeData,
            darkTheme: kDarkThemeData,
            statusBarColorBuilder: (theme) {
              setupSnackbarUi(theme);
              return theme.scaffoldBackgroundColor;
            },
            builder: (context, regularTheme, darkTheme, themeMode) {
              return MaterialApp(
                title: "Esewa",
                debugShowCheckedModeBanner: false,
                theme: regularTheme,
                darkTheme: darkTheme,
                themeMode: themeMode,
                initialRoute: Routes.startUpView,
                onGenerateRoute: Router().onGenerateRoute,
                navigatorKey: locator<NavigationService>().navigatorKey,
                locale: model.appLocale,
                supportedLocales: Constants.languages,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
              );
            },
          );
        },
      ),
    );
  }
}
