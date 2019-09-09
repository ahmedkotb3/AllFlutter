import 'package:big/Providers/AuthProvider.dart';
import 'package:big/Providers/Styles.dart';
import 'package:big/Screens/HomeScreen.dart';
import 'package:big/Screens/forget.dart';
import 'package:big/componets/appBar.dart';
import 'package:big/componets/shopping_icons.dart';
import 'package:big/model/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Consumer<DataProvider>(
                        builder: (context, stateManager, _) => emailInput(),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Consumer<DataProvider>(
                        builder: (context, dataProvider, _) => TextFormField(
                          obscureText: dataProvider.securePassword,
                          controller: passwordController,
                          maxLength: 32,
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
                              icon: new Icon(
                                Icons.remove_red_eye,
                                color: danger,
                              ),
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

                          onSaved: (value) {},
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgetPassword()),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
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
                              onPressed: () {
                                // print(emailController.text);
                                print(emailController.text);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                );

                                //  emailController.clear();
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              color: Colors.transparent),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'or Sign In with',
                        style: TextStyle(
                          color: DataProvider().primary,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
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
                              child: IconButton(
                                  padding: EdgeInsets.all(0.0),
                                  alignment: Alignment.center,
                                  iconSize: 20,
                                  icon: Icon(
                                    Shopping.facebook,
                                    color: DataProvider().primary,
                                  ),
                                  onPressed: () {
                                    AuthProvider().loginWithFB();
                                  })),
                          SizedBox(
                            width: 30,
                          ),
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
    );
  }

  TextFormField emailInput() {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5.0),
            borderSide: BorderSide(color: DataProvider().primary)),
        labelText: 'Email',
        // icon: new Icon(Icons.email),
      ),
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {},
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterPage()),
          );
        },
      ),
    );
  }
}