import 'dart:convert';
import 'package:big/localization/all_translations.dart';
import 'package:toast/toast.dart';
import 'package:big/Providers/AuthProvider.dart';
import 'package:big/Providers/Styles.dart';
import 'package:big/Screens/HomeScreen.dart';
import 'package:big/Screens/forget.dart';
import 'package:big/componets/appBar.dart';
import 'package:big/componets/shopping_icons.dart';
import 'package:big/model/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Providers/DataProvider.dart';
import './register.dart';
import './forget.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String title = "Sign In";
  Color danger = DataProvider().primary;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  var data;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (BuildContext context) => DataProvider(),
      child: Scaffold(
        appBar: Mybar(title, false),
        body: SafeArea(
          minimum: EdgeInsets.all(DataProvider().paddingApp),
          child: SingleChildScrollView(
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                      key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Consumer<DataProvider>(builder: (context, stateManager, _) => emailInput()),
                        SizedBox(height: 20),
                        Consumer<DataProvider>(
                          builder: (context, dataProvider, _) => TextFormField(
                            obscureText: dataProvider.securePassword,
                            controller: passwordController,
                            maxLength: 32,
                            validator: (value) {
                              if (value.length < 8) {
                                return 'Please enter Password more than 7 ';
                              }
                              return null;
                            },
//                          validator: (value),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: DataProvider().primary),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                              ),
                              // border: OutlineInputBorder(),
                              labelText: 'Password',
                              // icon: new Icon(Icons.lock_outline),
                              suffixIcon: new IconButton(
                                icon: new Icon(Icons.remove_red_eye, color: danger),
                                onPressed: () {
                                  if (danger == DataProvider().primary) {
                                    setState(() {
                                      danger = Colors.red;
                                    });
                                  } else if (danger == Colors.red) {
                                    setState(() {
                                      danger = DataProvider().primary;
                                    });
                                  }
                                  bool viewHide =
                                      dataProvider.securePassword == true
                                          ? false
                                          : true;
                                  dataProvider.securePassword = viewHide;
                                },
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FlatButton(
                              child: Text("Forget Your Password ?", style: TextStyle(color: DataProvider().primary,
                                  fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                              ),
                              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword()),);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        ButtonTheme(
                          minWidth: double.infinity,
                          height: 50.0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              gradient: LinearGradient(
                                colors: [
                                  Styles.appFirstColor,
                                  Styles.appSecondColor
                                ],
                              ),
                            ),
                            child: RaisedButton(
                                onPressed: ()async {
                                  if (_formKey.currentState.validate()) {
                                    //auth in api
                                    await AuthProvider().login('normal', emailController.text.trim(),passwordController.text).then((res){
                                       data=json.decode(res);
                                      if(data["success"]==true){
                                        print(data);
                                        //save name & email & image & token and navigate to home page
                                       goHome();
                                      }//handling errors
                                      else if(data["success"]==false){
                                        Toast.show("Email and Password do not match", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                                      }
                                    });
                                  }
                                },
                                child: Text(allTranslations.text("sign_in"), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                color: Colors.transparent),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text('or Sign In with', style: TextStyle(color: DataProvider().primary, fontSize: 18)),
                        SizedBox(height: 35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(50.0)),
                                  border: new Border.all(
                                    color: DataProvider().primary,
                                    width: 2.0,
                                  ),
                                ),
                                //////////////////////////////////facebook////////////////////////////////////////////////////////////
                                child: IconButton(padding: EdgeInsets.all(0.0), alignment: Alignment.center, iconSize: 20,
                                    icon: Icon(Shopping.facebook, color: DataProvider().primary),
                                    onPressed: ()async {
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      await  AuthProvider().loginWithFB();
                                      var facebookEmail= prefs.getString('userEmail');
                                      await AuthProvider().loginfb('facebook', facebookEmail).then((res){
                                        print(res);
                                        data=json.decode(res);
                                        if(data["success"]==true){
                                          print(data);
                                          savetoken();
                                          //save name & email & image & token and navigate to home page
                                        }
                                        else if(data["success"]==false){
                                          AuthProvider().logoutFace();
                                          prefs.clear();
                                          String error=data["errors"].toString();
                                          Toast.show(error, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                                        }//handling errors
                                      });
                                    })),
                            SizedBox(width: 30),
                            Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(50.0)),
                                  border: new Border.all(color: DataProvider().primary, width: 2.0),
                                ),
                                /////////////////////////////////////google////////////////////////////////////////////////////////////
                                child: IconButton(
                                    padding: EdgeInsets.all(0.0),
                                    alignment: Alignment.center,
                                    iconSize: 20,
                                    icon: Icon(Shopping.google, color: DataProvider().primary),
                                    onPressed: () async{
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                       await AuthProvider().googleLogin();
                                      var googleEmail= prefs.getString('userEmail');
                                       print('googleEmail $googleEmail');
                                      await AuthProvider().loginfb('google', googleEmail).then((res) async {
                                        print(res);
                                        data=json.decode(res);
                                        if(data["success"]==true){
                                          print(data);
                                          savetoken();
                                          //save name & email & image & token and navigate to home page
                                        }
                                        else if(data["success"]==false){
                                          AuthProvider().googleLogout();
                                          prefs.clear();
                                          String error=data["errors"].toString();
                                          Toast.show(error, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                                        }//handling errors
                                      });
                                    })),
                          ],
                        ),
                        new LoginScondButton()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
Future goHome()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('userToken',data["data"]["token"]);
  await prefs.setString('userName', data["data"]["user"]["name"]);
  await prefs.setString('userEmail', data["data"]["user"]["email"]);
  await prefs.setString('userImage', "https://cdn0.iconfinder.com/data/icons/avatar-78/128/12-512.png");
  await Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context) => new HomeScreen()));
}
Future savetoken()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('userToken',data["data"]["token"]);
  await  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
}
  TextFormField emailInput() {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: DataProvider().primary),
        ),
        border: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
        labelText: 'Email',
        // icon: new Icon(Icons.email),
      ),
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        return value.isEmpty ? "Email is required" : null;
      },
    );
  }
}

class LoginScondButton extends StatelessWidget {
  const LoginScondButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: FlatButton(
        child: Text.rich(
          TextSpan(
            text: "Don't have an account ? Sign Up ",
            style: TextStyle(
                color: DataProvider().primary,
                decoration: TextDecoration.underline),
          ),
        ),
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()),);
        },
      ),
    );
  }
}
