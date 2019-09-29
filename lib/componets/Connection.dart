import 'package:big/Providers/DataProvider.dart';
import 'package:big/Screens/HomeScreen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';

class FlareConnection extends StatelessWidget {
  final FlareControls controls = FlareControls();
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        home: Scaffold(body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery
                      .of(context)
                      .size
                      .width / 2,
                  child: new FlareActor(
                    "lib/assets/flare/NoConnection.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: 'play',
                  ),
                ),
                onTap: ()=>{

                Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen())),

                },
              ),
              Padding(
                padding: const EdgeInsets.only(top:15.0),
                child: Text("No Internet Connection Tap to refresh", style: TextStyle(
                    color: DataProvider().primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),),
              ),
            ],
          ),
        ),
        ),

      );
  }
}