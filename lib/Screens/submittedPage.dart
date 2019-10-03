import 'package:big/Providers/ColorsProvider.dart';
import 'package:big/localization/app_translation.dart';
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
                AppLocalizations.of(context).translateString("submit_order"),
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
                    AppLocalizations.of(context).translateString("return_home"),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => HomeScreen()));
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
