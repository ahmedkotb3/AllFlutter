import 'package:flutter/material.dart';
import '../Providers/DataProvider.dart';
import 'package:provider/provider.dart';
import '../Widgets//library.dart';
import './login.dart';
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {
  Color danger = Colors.deepPurple;
  TextEditingController nameController= new TextEditingController();
  TextEditingController emailController= new TextEditingController();
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Create New Account',
                            style: TextStyle(
                                color: DataProvider().primary,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                fontSize: 35,
                                height: 2.5),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                      Consumer<DataProvider>(
                        builder: (context, stateManager, _) =>
                       new Nameinput(nameController: nameController),
                      ),
                      Consumer<DataProvider>(
                        builder: (context, stateManager, _) =>
                            new EmailInput(emailController: emailController),
                      ),
                      Consumer<DataProvider>(
                        builder: (context, dataProvider, _) => TextFormField(
                          obscureText: dataProvider.securePassword,
                          controller: passwordController,
                          maxLength: 32,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(fontSize: 23),
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
                                    danger = Colors.deepPurple;
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
                          validator: (value) {
                            return value.isEmpty ? "password is required" : null;
                          },
                          onSaved: (value) {},
                        ),
                      ),
                      SizedBox(height: 20,),
                      new SignUPButton(nameController: nameController),
                      SizedBox(height: 20,),
                      new LoginScondButton(),
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

class LoginScondButton extends StatelessWidget {
  const LoginScondButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: FlatButton(
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
    );
  }
}

class SignUPButton extends StatelessWidget {
  const SignUPButton({
    Key key,
    @required this.nameController,
  }) : super(key: key);

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      height: 50.0,
      child: RaisedButton(
        child: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        onPressed: () {
          print(nameController.text);
        },
        color: DataProvider().primary,
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({
    Key key,
    @required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(fontSize: 23),
      ),
      validator: (value) {},
      onSaved: (value) {},
      controller: emailController,
    );
  }
}

class Nameinput extends StatelessWidget {
  const Nameinput({
    Key key,
    @required this.nameController,
  }) : super(key: key);

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name',
        labelStyle: TextStyle(fontSize: 23),
      ),
      validator: (value) {},
      onSaved: (value) {},
      controller: nameController,
    );
  }
}
