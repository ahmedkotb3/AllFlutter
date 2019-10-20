import 'dart:io';
import 'package:big/Screens/HomeScreen.dart';
import 'package:big/Screens/SubCategory.dart';
import 'package:big/Screens/payment.dart';
import 'package:big/Screens/shipping.dart';
import 'package:big/Screens/submittedPage.dart';
import 'package:big/componets/splashScreen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './Providers/DataProvider.dart';
import 'localization/all_translations.dart';

void main() async {
      await allTranslations.init();

   runApp(MyApp());}

class MyApp extends StatefulWidget {

  MyAppState createState() => MyAppState();
  

}


class MyAppState extends State<MyApp>{

void initState(){
        super.initState();

        // Initializes a callback should something need 
        // to be done when the language is changed
        allTranslations.onLocaleChangedCallback = _onLocaleChanged;
    }

     _onLocaleChanged() async {
        // do anything you need to do if the language changes
        print('Language has been changed to: ${allTranslations.currentLanguage}');
    }

  @override
  Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(

            localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
            ],
            // Tells the system which are the supported languages
            supportedLocales: allTranslations.supportedLocales(),

            home:SplashScreen(),

        );
  
  }
}
