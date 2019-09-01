import 'package:big/Screens/forget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/DataProvider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import './register.dart';
import './forget.dart';
class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  Color danger=Colors.deepPurple;
   TextEditingController emailController = new TextEditingController();
   TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (BuildContext context) => DataProvider(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Welcome Back !',
                        style: TextStyle(
                            color: DataProvider().primary,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            height: 2.5),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15,),
                      Consumer<DataProvider>(
                        builder: (context, stateManager, _) => emailInput(),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Consumer<DataProvider>(
                        builder: (context, dataProvider, _) => TextFormField(
                          
                          obscureText: dataProvider.securePassword,
                           controller: passwordController,
                          maxLength: 32,
//                          validator: (value),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                           ),
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
                               }else if(danger==Colors.deepPurple)
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
                       Row(
                         children: <Widget>[
                           FlatButton(child: Text("Forget Your Password ?",style: TextStyle(color: DataProvider().primary,fontWeight: FontWeight.bold),),
                            onPressed: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context) => ForgetPassword()),);
                            },),
                         ],
                       ),
                      SizedBox(height: 15,),

                      ButtonTheme(
                        minWidth: double.infinity,
                        height: 50.0,
                          child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                          onPressed: (){
                            // print(emailController.text);
                            print(emailController.text);
                          //  emailController.clear();
                            },
                          child: Text("Sign In",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                            ),
                          color: DataProvider().primary),
                      ),
                      SizedBox(height: 10,),
                      Text('OR',style: TextStyle(color: DataProvider().primary,fontSize:20,fontWeight: FontWeight.bold),),
                      Text('Sign In With',style: TextStyle(color: DataProvider().primary,fontSize:18),),
                      SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  SignInButton(
                  Buttons.Google,
                  mini: true,
                  onPressed: () {},
                            ),
                        SignInButton(
                         Buttons.Facebook,
                         mini:true ,
                         onPressed: (){},
                        )
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
                           border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                           ),
                          labelText: 'Email',
                          // icon: new Icon(Icons.email),
                        ),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                        },
                        validator: (value){
                       return   value.isEmpty?"Email is required":null;
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
    );
  }
}
