import 'package:flutter/material.dart';
import 'Screens/login.dart';
import 'Screens/set_NewPassword.dart';
import './Providers/DataProvider.dart';
import './Screens/register.dart';
import './Screens/SubCategory.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:DataProvider().primary,
      ),
      //home: LoginPage(),
      home: SubCategory(),
    );
  }
}