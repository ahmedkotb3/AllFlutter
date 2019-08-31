import 'dart:io';

import 'package:device_info/device_info.dart';
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
//get device token
 Future<List<String>> getDeviceDetails() async {
  String deviceName;
  String deviceVersion;
  String identifier;
  final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
  if (Platform.isAndroid) {
   var build = await deviceInfoPlugin.androidInfo;
   deviceName = build.model;
   deviceVersion = build.version.toString();
   identifier = build.androidId; //UUID for Android
   print(identifier);
  } else if (Platform.isIOS) {
   var data = await deviceInfoPlugin.iosInfo;
   deviceName = data.name;
   deviceVersion = data.systemVersion;
   identifier = data.identifierForVendor; //UUID for iOS
  }
//if (!mounted) return;
  return [deviceName, deviceVersion, identifier];
 }
 notifyListeners();
}


