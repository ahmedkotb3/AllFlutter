import 'package:big/componets/appBar.dart';
import 'package:flutter/material.dart';
import '../componets/shopping_icons.dart';
import '../Providers/DataProvider.dart';
import './details.dart';
import './main.dart';
import 'package:big/model/User.dart';
import 'package:provider/provider.dart';
import 'package:big/Providers/api.dart';

class CodeVerifity extends StatefulWidget {
  final User userdata;

  CodeVerifityState createState() => CodeVerifityState(userdata: userdata);
  CodeVerifity({Key key, @required this.userdata}) : super(key: key);
}

class CodeVerifityState extends State<CodeVerifity> {
  User userdata;
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
                            Icon(
                              Shopping.mobile_message,
                              size: 100.0,
                              color: DataProvider().primary,
                            ),
                            SizedBox(height: 30.0),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                'Verification Code sent to',
                              ),
                            ),
                            Text('+2018595626622',
                                style: TextStyle(color: Colors.blue)),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                  'Enter the digits code sent to your Phone'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: TextField(
                                controller: codeController,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    hintText: "Enter The Code",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                              ),
                            ),
                            Text('Didnt recive the code?'),
                            Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: InkWell(
                                child: Text(
                                  'RESEND',
                                  style: TextStyle(color: Colors.blue),
                                ),
                                onTap: () {},
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
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

                                    var response = await Api()
                                        .register("register", userdata);
                                    print(userdata.toJson());

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CodeTrue()),
                                    );
                                  },
                                ))
                          ],
                        ),
                      ),
                    ),
                  )));
        }));
  }
}
