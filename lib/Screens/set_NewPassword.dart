import 'package:big/Screens/login.dart';
import 'package:big/Screens/register.dart' as register;
import 'package:big/componets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/DataProvider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'login.dart';
import 'register.dart';

class SetNewPassword extends StatefulWidget {
  _SetNewPassword createState() => _SetNewPassword();
}

class _SetNewPassword extends State<SetNewPassword> {
  Color danger = DataProvider().primary;
    TextEditingController passwordControllerOld = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmpasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    void path() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }

    return ChangeNotifierProvider(
      builder: (BuildContext context) => DataProvider(),
      child: Scaffold(
        appBar: appBar('Change Password', false),
        body: SafeArea(
          minimum: EdgeInsets.all(DataProvider().paddingApp),
          child: SingleChildScrollView(
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      // Text(
                      //   'Reset Password',
                      //   style: TextStyle(
                      //       color: DataProvider().primary,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 40,
                      //       height: 2.5),
                      //   textAlign: TextAlign.left,
                      // ),
                      Consumer<DataProvider>(
                        builder: (context, dataProvider, _) => TextFormField(
                          obscureText: dataProvider.securePassword,
                          controller: passwordControllerOld,
                          maxLength: 32,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: DataProvider().primary),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                            // border: OutlineInputBorder(),
                            labelText: 'Current Password',
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
                      Consumer<DataProvider>(
                        builder: (context, dataProvider, _) => TextFormField(
                          obscureText: dataProvider.securePassword,
                          controller: passwordController,
                          maxLength: 32,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: DataProvider().primary),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                            // border: OutlineInputBorder(),
                            labelText: 'New Password',
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
                      Consumer<DataProvider>(
                        builder: (context, dataProvider, _) => TextFormField(
                          obscureText: true,
                          controller: confirmpasswordController,
                          maxLength: 32,
                          validator: (value) {
                            // if (value != passwordController.text) {
                            //     return 'Password is not matching';
                            //   }
                            return value != passwordController.text
                                ? 'Password is not matching'
                                : null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: DataProvider().primary),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                            // border: OutlineInputBorder(),
                            labelText: 'Confirm New Password',
                            // icon: new Icon(Icons.lock_outline),
                          ),
                          onSaved: (value) {},
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      new register.SignUPButton(
                        nameController: null,
                        navigate: path,
                        title: 'UPDATE PASSWORD',
                      ),
                      SizedBox(height: 10),
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
}
