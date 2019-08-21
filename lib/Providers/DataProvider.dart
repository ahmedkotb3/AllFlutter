import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class DataProvider with ChangeNotifier{
 Color primary=Colors.deepPurple;
 final appBlue = Color(0xFF193ca1);
 bool securePassword=true;
 
set setPassword(bool check){
securePassword=check;
notifyListeners();
 }

 bool get getPassword=>securePassword;
}


