import 'package:big/Providers/DataProvider.dart';
import 'package:big/Screens/HomeScreen.dart';
import 'package:big/componets/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './app_translation.dart';

class TranslationMain extends StatelessWidget {
  const TranslationMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: DataProvider().primary,
        scaffoldBackgroundColor: Colors.white,
      ),
      localizationsDelegates: [
        // A class which loads the translations from JSON files
        AppLocalizations.delegate,
        //provides localized strings
        GlobalMaterialLocalizations.delegate,
        //provides RTL support
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("en", "US"),
        const Locale("ar", "AE"),
        const Locale("fr", "FR"),
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
      //home: LoginPage(),
      home: SplashScreen(),
    );
  }
}
