import 'dart:io';
import 'package:big/Screens/SubCategory.dart';
import 'package:big/Screens/cart.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import './Providers/DataProvider.dart';
import 'package:big/Screens/HomeScreen.dart';
import 'package:big/Screens/checkout.dart';

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
     // home: RegisterPage(),
      home:HomeScreen(),
      //home:Checkout()
    );
  }
}
