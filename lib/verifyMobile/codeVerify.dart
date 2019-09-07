import 'package:flutter/material.dart';
import '../componets/shopping_icons.dart';
import '../Providers/DataProvider.dart';
import './details.dart';
import './main.dart';

class LoginPage extends StatefulWidget {
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: buildAppBar(),
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
                      Icon(
                        Shopping.mobile_message,
                        size: 100.0,
                        color: DataProvider().primary,
                      ),
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
                        child: Text('Enter the digits code sent to your Phone'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "Enter The Code",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
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
                          height: MediaQuery.of(context).size.height * .08,
                          child: RaisedButton(
                            color: Colors.blue,
                            child: Text('VERIFY',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
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
  }
}
