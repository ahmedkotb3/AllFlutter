import 'dart:convert';

import 'package:big/Providers/AuthProvider.dart';
import 'package:big/Screens/register.dart';
import 'package:big/componets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import '../componets/shopping_icons.dart';
import '../Providers/DataProvider.dart';
import './details.dart';
import './main.dart';
import 'package:big/model/User.dart';
import 'package:provider/provider.dart';

class CodeVerifity extends StatefulWidget {
  final User userdata;

  CodeVerifityState createState() => CodeVerifityState(userdata: userdata);
  CodeVerifity({Key key, @required this.userdata}) : super(key: key);
}

class CodeVerifityState extends State<CodeVerifity> {
  User userdata;
  var data;
  CodeVerifityState({Key key, @required this.userdata});

  TextEditingController codeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        builder: (_) => User(),
        child: Consumer<User>(builder: (context, user, _) {
          return MaterialApp(
              home: Scaffold(
                  appBar: Mybar("", false),
                  body: Container(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Mobile Number Verification',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(height: 30.0),
                            Icon(Shopping.mobile_message, size: 100.0, color: DataProvider().primary),
                            SizedBox(height: 30.0),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text('Verification Code sent to'),
                            ),
                            Text(userdata.getPhoneCountry()+':'+userdata.getPhone(),
                                style: TextStyle(color: Colors.blue)),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text('Enter the digits code sent to your Phone'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: TextField(
                                controller: codeController,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                    hintText: "Enter The Code",
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                              ),
                            ),
                            Text('Didnt recive the code?'),
                            Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: InkWell(
                                child: Text('RESEND', style: TextStyle(color: Colors.blue),),
                                onTap: () async{
                                  var rsponse = await AuthProvider().phoneVerify(userdata);
                                },
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                                width: MediaQuery.of(context).size.width * .8,
                                height:
                                    MediaQuery.of(context).size.height * .08,
                                child: RaisedButton(
                                  color: DataProvider().primary,
                                  child: Text('VERIFY',
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () async {
                                    userdata.setcodeuser(codeController.text);
                                    print(userdata.getCode());
                                    print(userdata.getEmail());
                                    if(userdata.getPassword()==null){
                                      var response = await AuthProvider().registerFG(userdata).then((res)async{
                                        print('pppppppppppppp$res');
                                        data=json.decode(res);
                                        if(data["success"]==true){
                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                          prefs.setString('userToken', data["data"]["token"]);
                                          print("registToken,${data["data"]["token"]}");
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => CodeTrue()),);
                                        }//handling errors
                                        else if(data["success"]==false){
                                          String error=data["errors"].toString();
                                          Toast.show(error, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                          await prefs.clear();
                                          await  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()),);
                                        }
                                      });
                                    }
                                    else{
                                      var response = await AuthProvider().register(userdata).then((res) async {
                                        data=json.decode(res);
                                        print("regist $res");
                                        if(data["success"]==true){
                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                          prefs.setString('userToken', data["data"]["token"]);
                                          print("registToken,${data["data"]["token"]}");
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => CodeTrue()),);
                                        }//handling errors
                                        else if(data["success"]==false){
                                          String error=data["errors"].toString();
                                          Toast.show(error, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                          await prefs.clear();
                                        await  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()),);
                                        }
                                      });
                                    }

                                    print(userdata.toJson());
                                  },
                                ))
                          ],
                        ),
                      ),
                    ),
                  )));

        },)
    );
  }
}
