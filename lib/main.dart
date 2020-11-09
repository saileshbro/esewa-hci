import 'package:esewa_hci/common/ui/ui_helpers.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:esewa_hci/app/locator.dart';
import 'package:esewa_hci/app/router.gr.dart';
import 'package:esewa_hci/app_localizations.dart';
import 'package:esewa_hci/common/constants.dart';
import 'package:esewa_hci/common/ui/screen_util.dart';
import 'package:esewa_hci/common/ui/theme/text_theme.dart';
import 'package:esewa_hci/ui/blocs/language_bloc/language_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LanguageBloc languageBloc;
  @override
  void initState() {
    languageBloc = locator<LanguageBloc>();
    super.initState();
  }

  @override
  void dispose() {
    languageBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return OKToast(
      duration: Duration(seconds: 3),
      position: ToastPosition.bottom,
      radius: dimen_16,
      textPadding: sPadding,
      child: BlocProvider(
        create: (context) => languageBloc,
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            if (state is LanguageLoaded) {
              return MaterialApp(
                title: "Esewa",
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  unselectedWidgetColor: Constants.primaryGreen,
                  primaryColor: Constants.primaryGreen,
                  scaffoldBackgroundColor: Colors.white,
                  accentColor: Constants.primaryGreen.withOpacity(0.4),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: ThemeText.getTextTheme(),
                  appBarTheme: const AppBarTheme(
                      elevation: 0,
                      iconTheme: IconThemeData(
                        color: Colors.black,
                      )),
                  iconTheme: IconThemeData(
                    color: Constants.primaryGreen,
                  ),
                  inputDecorationTheme: InputDecorationTheme(
                    fillColor: Constants.textFieldBackgroundColor,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  splashColor: Constants.primaryGreen.withOpacity(0.4),
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Constants.primaryGreen,
                  ),
                ),
                initialRoute: Routes.startUpView,
                onGenerateRoute: Router().onGenerateRoute,
                navigatorKey: locator<NavigationService>().navigatorKey,
                locale: state.locale,
                supportedLocales:
                    Constants.languages.map((e) => Locale(e.code)).toList(),
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
