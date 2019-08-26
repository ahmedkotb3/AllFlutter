import 'package:big/Screens/details.dart';
import 'package:flutter/material.dart';
import './Screens/login.dart';
import './Providers/DataProvider.dart';
import './Screens/register.dart';
import './Screens/SubCategory.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch:DataProvider().primary,
      ),
      //home: LoginPage(),
      home: ProductDetails(),
    );
  }
}