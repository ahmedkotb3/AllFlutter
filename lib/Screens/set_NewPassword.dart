import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/DataProvider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'register.dart';
class SetNewPassword extends StatefulWidget {
  _SetNewPassword createState() => _SetNewPassword();
}
class _SetNewPassword extends State<SetNewPassword> {

  Color danger=Colors.deepPurple;
   TextEditingController passwordController = new TextEditingController();
   TextEditingController confirmpasswordController = new TextEditingController();

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
                  child: SingleChildScrollView(
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Forgot Password',
                        style: TextStyle(
                            color: DataProvider().primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            height: 2.5),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10,),
                      Consumer<DataProvider>(
                        builder: (context, dataProvider, _) => TextFormField(
                          obscureText: dataProvider.securePassword,
                           controller: passwordController,
                          maxLength: 32,
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            labelText: 'Password',
                            // icon: new Icon(Icons.lock_outline),
                            suffixIcon: new IconButton(
                              icon: new Icon(
                                Icons.remove_red_eye,color: danger,
                              ),
                              onPressed: () {
                               if(danger==Colors.deepPurple)
                               {
                                 setState(() {
                                  danger=Colors.red; 
                                 });
                               }else if(danger==Colors.red)
                               {
                                 setState(() {
                                  danger=Colors.deepPurple; 
                                 });
                               } 
                                  bool viewHide =
                                  dataProvider.securePassword == true ? false : true;
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
                            return value != passwordController.text ? 'Password is not matching':null;
                            },
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            labelText: 'Confirm new Password',
                            // icon: new Icon(Icons.lock_outline),
                          ),
                          
                          onSaved: (value) {},
                        ),
                      ),
                      SizedBox(height: 50,),
                      ButtonTheme(
                        minWidth: double.infinity,
                        height: 50.0,
                          child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                          onPressed: (){
                            // print(emailController.text);                            
                          //  emailController.clear();
                            },
                          child: Text("Reset Password",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                            ),
                          color: DataProvider().primary),
                      ),
                      SizedBox(height: 10,),
                      ButtonTheme(
                      child: FlatButton(
                        child: Text.rich(TextSpan(children: <TextSpan>[
                          TextSpan(text: "Dont't have an account ? ",style: TextStyle(color: DataProvider().primary)),
                          TextSpan(
                            text: " Sign Up",
                            style: TextStyle(color: DataProvider().primary,fontWeight: FontWeight.bold),
                          )
                        ])),
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => RegisterPage()),);
                        },
                      ),
                    )
                       
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
