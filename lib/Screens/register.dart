import 'package:big/Providers/Styles.dart';
import 'package:big/Screens/mall.dart';
import 'package:big/componets/appBar.dart';
import 'package:flutter/material.dart';
import '../Providers/DataProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String title = 'Sign Up';
  Color danger = DataProvider().primary;
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (BuildContext context) => DataProvider(),
      child: Scaffold(
        appBar: Mybar(title, false),
        body: SafeArea(
          minimum: EdgeInsets.all(DataProvider().paddingApp),
          child: SingleChildScrollView(
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     FittedBox(
                      //       fit:BoxFit.fitWidth,
                      //       child: Text(
                      //         'Create New Account',
                      //         style: TextStyle(
                      //             color: DataProvider().primary,
                      //             fontWeight: FontWeight.bold,
                      //             fontFamily: 'Poppins',
                      //             fontSize: 28,
                      //             height: 2.5),
                      //         textAlign: TextAlign.center,
                      //       ),
                      //     ),
                      //     SizedBox(height: 20,),
                      //   ],
                      // ),
                      Consumer<DataProvider>(
                        builder: (context, stateManager, _) =>
                            new Nameinput(nameController: nameController),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Consumer<DataProvider>(
                        builder: (context, stateManager, _) =>
                            new EmailInput(emailController: emailController),
                      ),
                      SizedBox(
                        height: 20,
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
                            labelText: 'Password',
//                            labelStyle: TextStyle(fontSize: 23),
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
                            return value.isEmpty
                                ? "password is required"
                                : null;
                          },
                          onSaved: (value) {},
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      new SignUPButton(nameController: nameController,title: title,navigate: null,),
                      SizedBox(
                        height: 20,
                      ),
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
    );
  }
}

class SignUPButton extends StatelessWidget {
  SignUPButton({
    Key key,
    @required this.nameController,
    @required this.title,
    @required this.navigate,


  }) : super(key: key);
  
  String title;
  Function navigate;
  final TextEditingController nameController;
  void _signup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      height: 50.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          gradient: LinearGradient(
            colors: [Styles.appFirstColor, Styles.appSecondColor],
          ),
        ),
        child: RaisedButton(
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          onPressed: navigate,
          color: Colors.transparent,
        ),
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
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: DataProvider().primary),
        ),
        border: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
        labelText: 'Email',
//        labelStyle: TextStyle(fontSize: 23),
      ),
      validator: (value) {},
      onSaved: (value) {},
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
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
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: DataProvider().primary),
        ),
        border: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
        labelText: 'Name',
//        labelStyle: TextStyle(fontSize: 23),
      ),
      validator: (value) {},
      onSaved: (value) {},
      controller: nameController,
      keyboardType: TextInputType.text,
    );
  }
}
