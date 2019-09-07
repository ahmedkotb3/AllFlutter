import 'dart:convert' as JSON;
import 'dart:io';
import 'package:big/Screens/HomeScreen.dart';
import 'package:big/Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
class AuthProvider with ChangeNotifier{
  BuildContext context;
//String auth="https://api.myjson.com/bins/prpbz";
//Future<String> getuser() async{
//  http.Response response =await http.get(auth);
//   var myuser=JSON.decode(response.body);
//  print(myuser[0]["id"]);
//   return myuser;
//}
GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
googleLogin() async{
  try{
    await _googleSignIn.signIn();
    notifyListeners();
  } catch (err){
    print(err);
  }
}
googleLogout(){
  _googleSignIn.signOut();
}
////////////////////////////////////////////////////////////////////////
Map userProfile;
final facebookLogin = FacebookLogin();

loginWithFB() async{
  facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
  final result = await facebookLogin.logInWithReadPermissions(['email']);
  switch (result.status) {
    case FacebookLoginStatus.loggedIn:
      final token = result.accessToken.token;
      print('heloooooToken$token');
      final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
      final profile = JSON.jsonDecode(graphResponse.body);
      print(profile);
      Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()),);
      break;

    case FacebookLoginStatus.cancelledByUser:
      BuildContext context;
      Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()),);
      break;
    case FacebookLoginStatus.error:

          break;
  }
}
logoutFace(){
  facebookLogin.logOut();
  notifyListeners();
}

}



