import 'dart:convert' as JSON;
import 'dart:convert';
import 'dart:io';
import 'package:big/Screens/HomeScreen.dart';
import 'package:big/Screens/login.dart';
import 'package:big/model/User.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MainProvider.dart';

String customerAuth = "/auth/customer/";
String registerUrl = MainProvider().baseUrl + customerAuth + "register";
String phoneVerifyUrl = MainProvider().baseUrl + customerAuth + "message";
String loginUrl = MainProvider().baseUrl + customerAuth + "login";

class AuthProvider with ChangeNotifier {
  BuildContext context;

/////////////////////////////////Google Auth Login/////////////////////////////////////////////////
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

 Future googleLogin() async {
    try {
      await _googleSignIn.signIn();
      String googleUsermail = _googleSignIn.currentUser.email;
      String googleUserImage = _googleSignIn.currentUser.photoUrl;
      String googleUserName = _googleSignIn.currentUser.displayName;
      print('welcome from Google Auth name: ${googleUserName} email:${googleUsermail} image:${googleUserImage} ');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userName', googleUserName);
      await prefs.setString('userEmail', googleUsermail);
      await prefs.setString('userImage', googleUserImage);
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }
  googleLogout() {
    _googleSignIn.signOut();
    print("logout scsucccc");
  }

///////////////////////////////Facebook Auth Login/////////////////////////////////////////
  Map userProfile;
  final facebookLogin = FacebookLogin();

  Future loginWithFB() async {
    facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    final result = await facebookLogin.logInWithReadPermissions(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
      //  print('heloooooToken$token');
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        String fBUsrName=profile['name'];
        String fBUesrMail=profile['email'];
        String fBUserImage=profile['picture']['data']['url'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('userName', fBUsrName);
        await prefs.setString('userEmail', fBUesrMail);
        await prefs.setString('userImage', fBUserImage);
        print(fBUsrName);
        print(fBUesrMail);
        print(fBUserImage);
        break;
      case FacebookLoginStatus.cancelledByUser:
        BuildContext context;
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        break;
      case FacebookLoginStatus.error:
        break;
    }
  }
  logoutFace() {
    facebookLogin.logOut();
    notifyListeners();
  }
  ///////////////////////////////////////////Device token//////////////////////////////////////////////////////
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
      print(identifier);
    }
//if (!mounted) return;
//    return [deviceName, deviceVersion, identifier];
    return [identifier];
  }

////////////////////////////////////////////Normal Login & Register////////////////////////////////////////////////////////////
  Future register(User user) async {
    Response response = await post(registerUrl, body: {
      'name': user.getName(),
      'email': user.getEmail(),
      'password': user.getPassword(),
      'code': user.getCode(),
      'type': user.getType(),
      'device_id': user.getdeviceId(),
      "phone": user.getPhone(),
      "phone_country": user.getPhoneCountry()
    });
    int statusCode = response.statusCode;
    print("statusCode:${statusCode}");
    String body = response.body;
    print("body rrrrrrrrrrrrrrrrrrr:$body");
    return body;
  }
  Future registerFG(User user) async {
    Response response = await post(registerUrl, body: {
      'name': user.getName(),
      'email': user.getEmail(),
      'code': user.getCode(),
      'type': user.getType(),
      'device_id': user.getdeviceId(),
      "phone": user.getPhone(),
      "phone_country": user.getPhoneCountry()
    });
    int statusCode = response.statusCode;
    print("statusCode:${statusCode}");
    String body = response.body;
    print("bodyfbfbfb:$body");
    return body;
  }
  Future phoneVerify(User user)async {
    Response response = await post(phoneVerifyUrl, body: {
      "phone": user.getPhone(),
      "phone_country": user.getPhoneCountry()
    });
    int statusCode = response.statusCode;
    print("statusCode phoneVerify:${statusCode}");
    String body = response.body;
    print("body phoneVerify:$body");
  }

  Future<String> login(String type, String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Response response = await http.post(loginUrl, body: {
      'email': email,
      'password': password,
      'type': type,
    });
   // await prefs.setString('cookie', response.headers["set-cookie"]);
    int statusCode = response.statusCode;
    print("statusCode:${statusCode}");
//save in local storge for take all data from user
    var body = json.decode(response.body);
//print('body $body');
//print('userAuthToken:${body["data"]["token"]}');
    return response.body;
  }
  Future<String> loginfb(String type, String email) async {
    Response response = await http.post(loginUrl, body: {
      'email': email,
      'type': type,
    });
    int statusCode = response.statusCode;
    print("statusCode:${statusCode}");
//save in local storge for take all data from user
    var body = json.decode(response.body);
//print('body $body');
//print('userAuthTokenfb:${body["data"]["token"]}');
    return response.body;
  }
}
