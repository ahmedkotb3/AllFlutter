import 'package:big/localization/application.dart';
import 'package:flutter/material.dart';
import '../localization/app_translation.dart';

class Translation with ChangeNotifier {
  
  AppLocalizationsDelegate _appLocalizationsDelegate;

  static final List<String> languagesList = application.supportedLanguages;
  static final List<String> languageCodesList =
      application.supportedLanguagesCodes;

  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
    languagesList[2]: languageCodesList[2],
  };

   set setlang(String lang) {
    AppLocalizations appLocalization =new AppLocalizations(Locale(Translation().languagesMap[lang]));
    appLocalization.load();
    notifyListeners();
  } 
  
  // _appLocalizationsDelegate = AppLocalizationsDelegate();
  // application.onLocaleChanged = onLocaleChange;

  void onLocaleChange(Locale locale) async {
    _appLocalizationsDelegate = AppLocalizationsDelegate();
  }
}
