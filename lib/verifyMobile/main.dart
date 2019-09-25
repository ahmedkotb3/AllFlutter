import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../SizeConfig.dart';
import '../componets/shopping_icons.dart';
import '../Providers/DataProvider.dart';
import './codeVerify.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';


class VerifyMobile extends StatelessWidget {
  //VerifyMobile() : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: buildAppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "Mobile Number Verification",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Shopping.mobile_search,
                          size: 100.0,
                          color: DataProvider().primary,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "Enter your Mobile Number",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: DataProvider().primary),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: DataProvider().primary))),
                          child: new CountryCodePicker(
                            onChanged: print,
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            initialSelection: '+966',
                            favorite: ['+2', 'EG'],
                            // optional. Shows only country name and flag
                            showCountryOnly: false,
                            // optional. Shows only country name and flag when popup is closed.
                            showOnlyCountryWhenClosed: false,
                            // optional. aligns the flag and the Text left
                            alignLeft: false,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              //maxLength: 15,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(15)
                              ],
                              decoration: InputDecoration.collapsed(
                                  hintText: '012 - 3567 - 8290'),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0),
                  new Container(
                    width: MediaQuery.of(context).size.width * .8,
                    height: MediaQuery.of(context).size.height * .08,
                    child: RaisedButton(
                      child: Text(
                        'SEND CODE',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        //sendphone();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      color: DataProvider().primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: DataProvider().primary,
          ),
          onPressed: () => Navigator.of(context).pop(),
        );
      },
    ),
  );
}

sendphone() async {
  var response = await http.post(
      'http://18.217.190.199/api/auth/customer/message',
      body: {"phone_country": "EG", "phone": "1270089496"});

  print(response);
}
