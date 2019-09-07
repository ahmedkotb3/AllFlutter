import 'package:big/Providers/DataProvider.dart';
import 'package:big/Providers/Styles.dart';
import 'package:big/Screens/register.dart';
import 'package:big/Screens/set_NewPassword.dart';
import 'package:big/componets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:big/Screens/login.dart';
import './confirm.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatelessWidget {
  String email;
  TextEditingController nameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
     void path() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ConfirmPassword()),
          );  
  }
    return ChangeNotifierProvider(
      builder: (BuildContext context) => DataProvider(),
      child: Scaffold(
        appBar: Mybar('Forget Password', false),
        body: SafeArea(
          minimum: EdgeInsets.all(32.0),
          child: Center(
            child: ListView(
              padding: EdgeInsets.only(left: 10, right: 10, top: 30),
              children: <Widget>[
                //   SizedBox(height: 50,),
                //   Text('Forget Password ?',
                //       style: TextStyle(
                //         color:DataProvider().primary,
                //         fontSize:30,
                //         fontWeight: FontWeight.bold,
                //       ),),
                //  SizedBox(height: 30,),
                Text(
                  'Enter your E-mail address to reset your Password',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: DataProvider().primary),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    labelText: "Email",
                  ),
                  validator: (input) =>
                      !input.contains('@') ? 'Not a Valid E-mail' : null,
                  onSaved: (input) => email = input,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 30,
                ),
                new SignUPButton(nameController: nameController,title: 'Submit',navigate:path),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     new SignUPButton(nameController: nameController),
                //   ],
                // ),
                FlatButton(
                  child: Text.rich(
                    TextSpan(
                      text: "Already have an account ? Sign In",
                      style: TextStyle(
                          color: DataProvider().primary,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
