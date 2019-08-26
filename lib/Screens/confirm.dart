import 'package:big/Providers/DataProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import './set_NewPassword.dart';
import 'register.dart';
class ConfirmPassword extends StatefulWidget{
  ConfirmPasswordState createState() => ConfirmPasswordState();
}
class ConfirmPasswordState extends State<ConfirmPassword>{

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (BuildContext context) => DataProvider(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.deepPurple),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body:SafeArea(
          child:SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 40,),
                    Text('Forgot password ?',style:TextStyle(color:DataProvider().primary,
                        fontSize: 30,fontWeight: FontWeight.bold)),
                    SizedBox(height: 40,),
                    Text('A Confirmation code has been sent to your email',style:TextStyle(fontSize:18,color: Colors.grey ) ,),
                    SizedBox(height: 40,),
                    Padding(
                      padding: EdgeInsets.only(left:40,right: 40),
                      child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Activation Code',
                          ),
                        maxLength: 6,
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    SizedBox(height: 40,),
                    ButtonTheme(
                      buttonColor:DataProvider().primary,
                      minWidth: double.infinity,
                      height: 50.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => SetNewPassword()),);
                        },
                        child: Text("Submit",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,fontSize: 20),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 60,),
                        LoginScondButton(),
                      ],
                    )
                  ],

                ),

              ),
            ),
          ),
        ),
      ),
    ) ;
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
        child: Text.rich(TextSpan(children: <TextSpan>[
          TextSpan(text: "Don't have an account ? ",style: TextStyle(color: DataProvider().primary)),
          TextSpan(
            text: " Sign Up",
            style: TextStyle(color: DataProvider().primary,fontWeight: FontWeight.bold),
          )
        ])),
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => RegisterPage()),);
        },
      ),
    );
  }
}
