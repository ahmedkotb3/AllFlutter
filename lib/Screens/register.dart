import 'package:big/Providers/AuthProvider.dart';
import 'package:big/Providers/Styles.dart';
import 'package:big/componets/appBar.dart';
import 'package:big/componets/shopping_icons.dart';
import 'package:flutter/material.dart';
import '../Providers/DataProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './login.dart';
import 'package:big/model/User.dart';
import 'package:big/verifyMobile/main.dart';


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
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers:[
      ChangeNotifierProvider(builder: (BuildContext context) => DataProvider(),),

      ChangeNotifierProvider(builder: (_) => User(),)],

      child: Consumer<User>(builder: (context, user, _) {
     return Scaffold(
        appBar: Mybar(title, false),
        body: SafeArea(
          minimum: EdgeInsets.all(DataProvider().paddingApp),
          child: SingleChildScrollView(
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Consumer<DataProvider>(
                          builder: (context, stateManager, _) =>
                              new Nameinput(nameController: nameController),
                        ),
                        SizedBox(height: 20),
                        Consumer<DataProvider>(
                          builder: (context, stateManager, _) =>
                              new EmailInput(emailController: emailController),
                        ),
                        SizedBox(height: 20),

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
                                icon: new Icon(Icons.remove_red_eye, color: danger),
                                onPressed: () {
                                  if (danger == DataProvider().primary) {
                                    setState(() {
                                      danger = Colors.red;
                                    });
                                  } else if (danger == Colors.red) {
                                    setState(() {
                                      danger = DataProvider().primary;
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
                              if (value.length < 8) {
                                return 'Please enter Password more than 7 ';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        new SignUPButton(
                          nameController: nameController,
                          title: title,
                          navigate: () async{
                            if (_formKey.currentState.validate()) {
                            var myuser = Provider.of<User>(context);
                            myuser.setnameuser(nameController.text.trim());
                            myuser.setemailuser(emailController.text.trim());
                            myuser.setpassworduser(passwordController.text.trim());
                            myuser.settypeuser('normal');
                            myuser.setdeviceIduser('12345678');
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.setString('userName', nameController.text.trim());
                            await prefs.setString('userEmail', emailController.text.trim());
                            await prefs.setString('userPassword', passwordController.text.trim());
                            await prefs.setString('userImage',"https://cdn0.iconfinder.com/data/icons/avatar-78/128/12-512.png");
                             await  Navigator.push(context, MaterialPageRoute(builder: (context) => Verify(newuser: myuser)));
                            print(myuser.toJson());
                          }
                           },
                        ),
                        SizedBox(height: 20),
                        Text('Or Sign up with', style: TextStyle(color: DataProvider().primary, fontSize: 18)),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(50.0)),
                                  border: new Border.all(
                                    color: DataProvider().primary,
                                    width: 2.0,
                                  ),
                                ),
                                child: IconButton(padding: EdgeInsets.all(0.0), alignment: Alignment.center, iconSize: 20,
                                    icon: Icon(Shopping.facebook, color: DataProvider().primary),
//                                    onPressed: ()async {
//                                      AuthProvider().loginWithFB();
//                                    }
                                onPressed: (){},
                                    )),
                            SizedBox(width: 30),
                            Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(50.0)),
                                  border: new Border.all(color: DataProvider().primary, width: 2.0),
                                ),
                                child: IconButton(
                                    padding: EdgeInsets.all(0.0),
                                    alignment: Alignment.center,
                                    iconSize: 20,
                                    icon: Icon(Shopping.google, color: DataProvider().primary),
                                    //onPressed: //() async{
                                      //await   AuthProvider().googleLogin();
                                      //await  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                                    //}
                                  onPressed: ()async{
                                      //call google model
                                  await  AuthProvider().googleLogin();
                                  // call storage to get data has been set before
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    var googleName= prefs.getString('userName');
                                    var googleEmail= prefs.getString('userEmail');
                                    //get device Id
                                    String deviceId;
                                    await AuthProvider().getDeviceDetails().then((res){deviceId=res[0];
                                      print( 'device id$deviceId');
                                    });
                                    var myuser = Provider.of<User>(context);
                                    myuser.setnameuser(googleName);
                                    myuser.setemailuser(googleEmail);
                                    myuser.settypeuser('google');
                                    myuser.setdeviceIduser(deviceId);
                                  await Navigator.push(context, MaterialPageRoute(builder: (context) => Verify(newuser: myuser)));
                                  },
                                    ),
                            ),
                          ],
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
      ));
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
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
      validator: _validateEmail,
      onSaved: (value) {},
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
    );
  }
  String _validateEmail(String value) {
    if (value.isEmpty) {
      // The form is empty
      return "Please Enter valid email address";
    }
    // This is just a regular expression for email addresses
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value)) {
      // So, the email is valid
      return null;
    }

    // The pattern of the email didn't match the regex above.
    return 'Email is not valid';
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
      validator: (value) {
        if (value.isEmpty == true) {
          return 'Please enter your name ';
        }
        return null;
      },
      onSaved: (value) {},
      controller: nameController,
      keyboardType: TextInputType.text,
    );
  }
}
