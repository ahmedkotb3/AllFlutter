import 'package:flutter/material.dart';
import 'Screens/set_NewPassword.dart';
import './Providers/DataProvider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch:DataProvider().primary,
      ),
      home: SetNewPassword(),
    );
  }
}