import 'dart:io';
import 'package:big/Screens/payment.dart';
import 'package:big/Screens/shipping.dart';
import 'package:big/componets/splashScreen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import './Providers/DataProvider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: DataProvider().primary,
        scaffoldBackgroundColor: Colors.white,
      ),
      //home: LoginPage(),
      home: SplashScreen(),
    );
  }
}
