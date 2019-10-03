import 'package:big/Providers/DataProvider.dart';
import 'package:big/Screens/customProgess.dart';
import 'package:big/componets/appBar.dart';
import 'package:big/componets/buildTextForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import './editAccount.dart';
import 'checkout.dart';

class Shipping extends StatefulWidget {
  Shipping({Key key}) : super(key: key);

  _ShippingState createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
  Country _selected;
  //Country selectedCountry = ;
  TextEditingController addressController = new TextEditingController();
  TextEditingController landmarkController = new TextEditingController();
  TextEditingController zipController = new TextEditingController();
  double hieghtAll = 20.0;
  String demoaddress = "xzy street, abc city";
  String demozip = "123456";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: Mybar("Shipping", false),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(right:32.0,left:32.0,bottom:32.0),
            child: Column(children: <Widget>[
              CustomProgressBar(2),
              SizedBox(height: hieghtAll),
              Container(
                height: 52.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: DataProvider().primary),
                    borderRadius: BorderRadius.circular(5.0),
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CountryPicker(
                    dense: false,
                    showFlag: true, //displays flag, true by default
                         //displays dialing code, false by default
                    showName: true, //displays country name, true by default
                    onChanged: (Country country) {
                      setState(() {
                        _selected = country;
                      });
                    },
                    selectedCountry: _selected,
                  ),
                ),
              ),
              SizedBox(height: hieghtAll),
              buildTextForm(addressController, demoaddress, "Address", null,
                  TextInputType.text),
              SizedBox(height: hieghtAll),
              buildTextForm(landmarkController, demoaddress, "Street Landmark",
                  null, TextInputType.text),
              SizedBox(height: hieghtAll),
              buildTextForm(zipController, demozip, "Zip code", null,
                  TextInputType.text),
              SizedBox(height: hieghtAll),
              Container(
                  width: MediaQuery.of(context).size.width * .85,
                  height: MediaQuery.of(context).size.height * .08,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                    color: DataProvider().primary,
                    child: Text(
                      'PROCEED TO PAYMENT',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Checkout(
                                addressController,_selected, landmarkController,zipController
                              )));
                    },
                  ))
            ]),
          ),
        ));
  }
}
