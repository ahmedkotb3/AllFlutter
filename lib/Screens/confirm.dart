import 'package:big/Providers/DataProvider.dart';
import 'package:big/componets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import './set_NewPassword.dart';
import 'register.dart';
import 'package:big/Screens/login.dart' as login;

class ConfirmPassword extends StatefulWidget {
  ConfirmPasswordState createState() => ConfirmPasswordState();
}

class ConfirmPasswordState extends State<ConfirmPassword> {
      void path() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SetNewPassword()),
      );
      }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (BuildContext context) => DataProvider(),
      child: Scaffold(
        appBar: Mybar('Forgot password ?', false),
        body: SafeArea(
          minimum: EdgeInsets.all(DataProvider().paddingApp),
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 40),
                    Text(
                      'A Confirmation code has been sent to your email',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                          labelText: 'Activation Code',
                        ),
                        maxLength: 6,
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    SizedBox(height: 40),
                    new SignUPButton(
                      nameController: null,
                      title: 'Submit',
                      navigate: path,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 60),
                        login.LoginScondButton(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
