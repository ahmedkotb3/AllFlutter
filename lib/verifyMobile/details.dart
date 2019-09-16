import 'package:big/Screens/HomeScreen.dart';
import 'package:big/componets/appBar.dart';
import 'package:flutter/material.dart';
import '../componets/shopping_icons.dart';
import '../Providers/DataProvider.dart';

class CodeTrue extends StatelessWidget {
  // Declare a field that holds the Todo.
  //final Todo todo;

  // In the constructor, require a Todo.
  // DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: Mybar("", false),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Shopping.mobile_true,
                  size: 140.0,
                  color: DataProvider().primary,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                "Awesome!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0XFF4285f4), fontSize: 20.0,fontWeight: FontWeight.bold),
              ),
              Text(
                "your mobile number verified successfully",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0XFF3f3f3f), fontSize: 14.0),
              ),
              SizedBox(height: 50.0),
              Container(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .08,
                child: RaisedButton(
                  child: Text(
                    'LETS START!',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));

                    //sendphone();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ),
                    // );
                  },
                  color: DataProvider().primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
