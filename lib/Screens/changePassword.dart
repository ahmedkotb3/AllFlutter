import 'package:big/Providers/ColorsProvider.dart';
import 'package:big/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController oldPasswordController = new TextEditingController();
  TextEditingController newPasswordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  double hieghtAll = 20.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: hieghtAll),
              buildTextForm(oldPasswordController,"Current Password","Current Password",null,null,true),
              SizedBox(height: hieghtAll),
              buildTextForm(newPasswordController,"New Password","New Password",null,null,true),
              SizedBox(height: hieghtAll),
              buildTextForm(confirmPasswordController,"Confirm Password","Confirm Password",null,null,true),
              SizedBox(height: hieghtAll),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    if(confirmPasswordController.text==newPasswordController.text)
                    {
                      print("right password");
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
                    }
                    else{
                      print("try");
                    }
                    //  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Checkout()));
                  },
                  child: Text(
                    "Update Password",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                  color: ColorProvider().primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildTextForm(TextEditingController takeInput, String oldData,
      [String sideText, Icon sideIcon, TextInputType mytype, bool secret = false, int lines, bool Enabled = true]) {
    return new Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorProvider().primary),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextFormField(
        enabled: Enabled,
        decoration: InputDecoration(
          suffixText: sideText,
          hintText: oldData,
          suffixIcon: sideIcon,
          contentPadding: EdgeInsets.all(15.0),
        ),
        obscureText: secret,
        keyboardType: mytype,
        maxLines: lines,
        controller: takeInput,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: ColorProvider().primary),
      ),
    );
  }
}