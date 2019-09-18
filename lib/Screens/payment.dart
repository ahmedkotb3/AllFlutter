import 'package:big/Providers/DataProvider.dart';
import 'package:big/Screens/checkout.dart';
import 'package:big/componets/appBar.dart';
import 'package:big/componets/buildTextForm.dart';
import 'package:flutter/material.dart';

import 'customProgess.dart';
import 'submittedPage.dart';

class Payment extends StatefulWidget {
  Payment({Key key}) : super(key: key);

  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  TextEditingController cardNameController = new TextEditingController();
  TextEditingController cardNoController = new TextEditingController();
  TextEditingController expiresDataController = new TextEditingController();
  TextEditingController cvvController = new TextEditingController();

  String demoname = "John Doe";
  String democardno = "1234 - 5678 - 3459 - 2456";
  String demoexpiryDate = "05 / 21";
  String democvv = "123";
  String dropdownValue = 'Cash on Delivery';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: Mybar("Proceed to Payment", false),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(right: 32.0, left: 32.0, bottom: 32.0),
            child: Column(children: <Widget>[
              CustomProgressBar(4),
              SizedBox(height: 15.0),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: DataProvider().primary),
                    borderRadius: BorderRadius.circular(5.0)),
                width: double.infinity,
                child: DropdownButtonHideUnderline(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: DataProvider().primary,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: DataProvider().primary),
                      // underline: Container(
                      //   height: 2,
                      //   color: DataProvider().primary,
                      // ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>[
                        'Cash on Delivery',
                        'Credit or Debit Card',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              dropdownValue == "Credit or Debit Card"
                  ? Column(children: <Widget>[
                      buildTextForm(cardNameController, demoname,
                          "CARDHOLDER NAME", null, TextInputType.text),
                      buildTextForm(cardNoController, democardno, "CARD NUMBER",
                          null, TextInputType.text, false, false),
                      buildTextForm(
                          expiresDataController,
                          demoexpiryDate,
                          "EXPIRE DATE",
                          null,
                          TextInputType.datetime,
                          false,
                          false,
                          1,
                          true,
                          5),
                      buildTextForm(cvvController, democvv, "CVV", null,
                          TextInputType.number, true, true, 1, true, 3),
                    ])
                  : Container(),
              SizedBox(height: 15.0),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: shipmentFees(MainAxisAlignment.start),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
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
                              builder: (BuildContext context) =>
                                  SubmittedPage()));
                    },
                  ))
            ]),
          ),
        ));
  }
}
