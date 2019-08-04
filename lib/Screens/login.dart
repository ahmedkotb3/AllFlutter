import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/DataProvider.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email,password;
  Color danger=Colors.deepPurple;
  TextEditingController emailController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (BuildContext context) => DataProvider(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Welcome Back !',
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          height: 3),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 70,),
                    Consumer<DataProvider>(
                      builder: (context, stateManager, _) => TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          icon: new Icon(Icons.email),
                        ),
                        controller: emailController,
                        onSaved: (value) {
                          setState(() {
                           email=value; 
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Consumer<DataProvider>(
                      builder: (context, stateManager, _) => TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          icon: new Icon(Icons.lock_outline),
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
// bool viewHide =
//     stateManager.mypassword == true ? false : true;
// stateManager.mypassword = viewHide;
// viewHide==false?danger.red:danger.blue;
                            },
                          ),
                        ),
                        onSaved: (value) {},
                      ),
                    ),
                    SizedBox(height: 20,),
                    RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      onPressed: (){print(emailController.text);},
                      child: Text("Sign In",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                        ),
                      color: Colors.deepPurple,)
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
