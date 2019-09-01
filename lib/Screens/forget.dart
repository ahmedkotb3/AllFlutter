import 'package:big/Providers/DataProvider.dart';
import 'package:flutter/material.dart';
import 'package:big/Screens/login.dart';
import './confirm.dart';
import 'package:provider/provider.dart';
class ForgetPassword extends StatelessWidget {
  String email ;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (BuildContext context) => DataProvider(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
        backgroundColor: Colors.transparent,
         leading: new IconButton(
               icon: new Icon(Icons.arrow_back, color: DataProvider().primary),
               onPressed: () => Navigator.of(context).pop(),
              ),
        ),
        body: SafeArea(
          child: Center(child: ListView(
            padding: EdgeInsets.only(left: 10,right:10,top: 30),
          children: <Widget>[
            SizedBox(height: 50,),
            Text('Forget Password ?',
                style: TextStyle(
                  color:DataProvider().primary,
                  fontSize:30,
                  fontWeight: FontWeight.bold,
                ),),
           SizedBox(height: 30,),
            Text(
                  'Enter your E-mail address to rest your Password',
                style: TextStyle(
                  color:Colors.grey,
                  fontSize:15),),
          SizedBox(height: 10,),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                           ),
              labelText: "Email",
            ),
            validator: (input)=> !input.contains('@') ?'Not a Valid E-mail':null,
            onSaved: (input) => email = input,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonTheme(
                minWidth: 300,
                  height: 50,
                                child: RaisedButton(
                    color: DataProvider().primary,
                     onPressed: (){
                       Navigator.push(context,MaterialPageRoute(builder: (context) => ConfirmPassword()),);
                     },
                    child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 20),
                    ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  ),
                ),
              )
            ],
          ),
          FlatButton(
          child: Text.rich(TextSpan(children: <TextSpan>[
            TextSpan(text: "Already have an account ? ",style: TextStyle(color: DataProvider().primary)),
            TextSpan(
              text: " Sign In",
              style: TextStyle(color: DataProvider().primary,fontWeight: FontWeight.bold),
            )
          ])),
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()),);
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
