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
                              if (value.length < 6) {
                                return 'Please enter Password more than 6 ';
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
                              child: Text(
                                "Forget Your Password ?",
                                style: TextStyle(
                                  color: DataProvider().primary,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
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
                                    await AuthProvider().login('normal',emailController.text.trim(),passwordController.text);
                                    //save user data in local storage
                                    Navigator.of(context).pushReplacement(
                                        new MaterialPageRoute(builder: (context) => new HomeScreen()));
                                    print(emailController.text.trim());
                                  }
                                },
                                child: Text("Sign In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
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
                                child: IconButton(padding: EdgeInsets.all(0.0), alignment: Alignment.center, iconSize: 20,
                                    icon: Icon(
                                      Shopping.facebook,
                                      color: DataProvider().primary,
                                    ),
                                    onPressed: () {
                                      AuthProvider().loginWithFB();
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
                                child: IconButton(
                                    padding: EdgeInsets.all(0.0),
                                    alignment: Alignment.center,
                                    iconSize: 20,
                                    icon: Icon(
                                      Shopping.google,
                                      color: DataProvider().primary,
                                    ),
                                    onPressed: () {
                                      AuthProvider().googleLogin();
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
