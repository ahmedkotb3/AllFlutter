import 'package:big/Providers/ColorsProvider.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class SubmittedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Your Order is Submitted",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              Container(
                height: 200,
                width: 100,
                child: Image.asset("lib/assets/images/fullbag.png"),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1,
                height: 50,
                child: RaisedButton(
                  child: Text(
                    "Return Home",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
                  },
                  elevation: 10.0,
                  color: ColorProvider().primary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
