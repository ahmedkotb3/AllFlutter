import 'package:big/Screens/SubCategory.dart';
import 'package:big/Screens/cart.dart';
import 'package:big/Screens/emptyCart.dart';
import 'package:big/Screens/register.dart';
import 'package:big/Screens/submittedPage.dart';
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
      ),
      //home: LoginPage(),
      home: SubCategory(),
    );
  }
}