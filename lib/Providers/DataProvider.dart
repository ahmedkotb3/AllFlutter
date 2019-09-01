import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class DataProvider with ChangeNotifier{
 Color primary=Colors.blue[900];
 bool securePassword=true;
 
set setPassword(bool check){
securePassword=check;
notifyListeners();
 }

 bool get getPassword=>securePassword;
}


