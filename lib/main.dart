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
import 'localization/app_translation.dart';
import './localization/translagionMain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
     return TranslationMain();
  }
}
