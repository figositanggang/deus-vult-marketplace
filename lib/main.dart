import 'dart:async';

import 'package:code_project/Bottom%20Navigation%20Screen/Home%20Screen/Provider/locale_provider.dart';
import 'package:code_project/Bottom%20Navigation%20Screen/Search%20Screen/Search_Navigation.dart';
import 'package:code_project/Bottom%20Navigation%20Screen/Home%20Screen/Provider/carousel_slider_provider.dart';
import 'package:code_project/Bottom%20Navigation%20Screen/Home%20Screen/Provider/scroll_provider.dart';
import 'package:code_project/Bottom%20Navigation%20Screen/Home%20Screen/Provider/search_provider.dart';
import 'package:code_project/Bottom%20Navigation%20Screen/Profile%20Screen/Provider/data_provider.dart';
import 'package:code_project/Model/all_model.dart';
import 'package:code_project/Model/diskon_model.dart';
import 'package:code_project/Model/rekomendasi_model.dart';
import 'package:code_project/Screen/Checkout_Screen.dart';
import 'package:code_project/Screen/Edit_Data_Screen.dart';
import 'package:code_project/Screen/Login_Screen.dart';
import 'package:code_project/Screen/Setting_Screen.dart';
import 'package:code_project/Screen/SignUp_Screen.dart';
import 'package:code_project/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FlutterError.onError = (details) {
    FirebaseCrashlytics.instance.recordFlutterError(details);
  };

  PlatformDispatcher.instance.onError = (exception, stackTrace) {
    FirebaseCrashlytics.instance
        .recordError(exception, stackTrace, fatal: true);
    return true;
  };

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => BottomNavProvider()),
      ChangeNotifierProvider(create: (_) => CarouselSliderProvider()),
      ChangeNotifierProvider(create: (_) => ScrollProvider()),
      ChangeNotifierProvider(create: (_) => HomeSearchProvider()),
      ChangeNotifierProvider(create: (_) => RekomendasiModelClass()),
      ChangeNotifierProvider(create: (_) => RekomendasiModelClass()),
      ChangeNotifierProvider(create: (_) => AllModelClass()),
      ChangeNotifierProvider(create: (_) => DiskonModelClass()),
      ChangeNotifierProvider(create: (_) => DataProvider()),
      ChangeNotifierProvider(create: (_) => LoginScreenProvider()),
      ChangeNotifierProvider(create: (_) => SignUpScreenProvider()),
      ChangeNotifierProvider(create: (_) => SettingScreenProvider()),
      ChangeNotifierProvider(create: (_) => CheckoutProvider()),
      ChangeNotifierProvider(create: (_) => LocaleProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingProvider = Provider.of<SettingScreenProvider>(context);
    final localeProv = Provider.of<LocaleProvider>(context);
    LocalJsonLocalization.delegate.directories = ['assets/i18n'];

    return FutureBuilder(
      future: settingProvider.readDark(),
      builder: (context, snapshotDark) {
        return FutureBuilder(
          future: localeProv.readLocale(),
          builder: (context, AsyncSnapshot snapshotLocale) {
            return MaterialApp(
              initialRoute: '/',
              theme: snapshotDark.data != true
                  ? myTheme(context, settingProvider)
                  : ThemeData(
                      brightness: Brightness.dark,
                      primaryColor: Color.fromARGB(255, 37, 37, 37),
                      appBarTheme: AppBarTheme(
                        foregroundColor: Colors.white,
                        backgroundColor: Color.fromARGB(255, 60, 60, 60),
                      ),
                      inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
              routes: {
                '/': (context) => MainScreen(),
                "/search_navigation": (context) => SearchNavigation(),
                '/login_screen': ((context) => LoginScreen()),
                '/sign-up_screen': ((context) => SignUpScreen()),
                '/edit-data_screen': ((context) => EditDataScreen()),
                '/settings_screen': ((context) => SettingScreen()),
              },
              debugShowCheckedModeBanner: false,
              locale: snapshotLocale.data == true
                  ? Locale('en', 'US')
                  : Locale('id', 'ID'),
              supportedLocales: [
                Locale('en', 'US'),
                Locale('id', 'ID'),
              ],
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                LocalJsonLocalization.delegate,
              ],
            );
          },
        );
      },
    );
  }
}

ThemeData myTheme(BuildContext context, SettingScreenProvider settingProv) {
  return ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
    }),
    splashColor: Colors.transparent,
    primaryColor: settingProv.color,
    buttonTheme: ButtonThemeData(
      splashColor: Colors.transparent,
    ),
    splashFactory: InkRipple.splashFactory,
    brightness: Brightness.light,
  );
}

Color primaryColor(BuildContext context) {
  return Theme.of(context).primaryColor;
}
