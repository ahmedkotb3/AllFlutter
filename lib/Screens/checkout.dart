import 'package:big/Screens/customProgess.dart';
import 'package:big/Screens/payment.dart';
import 'package:big/Screens/submittedPage.dart';
import 'package:big/componets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';

class Checkout extends StatefulWidget {
  TextEditingController address;
  Country country;
  TextEditingController landmark;
  TextEditingController zip;
  Checkout(this.address, this.country, this.landmark, this.zip);
  CheckoutState createState() => CheckoutState();
}

class CheckoutState extends State<Checkout> {
  List<MyProudct> _Mylist = null;

  void initState() {
    super.initState();
    _Mylist = shipmentList.where((i) => i.proudctName.startsWith('L')).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Mybar("Checkout", false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              CustomProgressBar(3),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('John Doe'),
                        Text('johndoe@example.com'),
                        Text('01270089499'),
                        Text(
                            'Address: ${widget.address.text} ${widget.country.name}'),
                        Text('Landmark: ${widget.landmark.text}'),
                        Text('Zip: ${widget.zip.text}')
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: shipmentData(),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: shipmentFees(MainAxisAlignment.end),
                ),
              ),
              Checkoutbottom(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget shipmentData() => DataTable(
        columns: <DataColumn>[
          DataColumn(
            label: Text('Product'),
            numeric: false,
            onSort: (i, b) {},
            tooltip: 'display the product name',
          ),
          DataColumn(
            label: Text('Qty'),
            numeric: false,
            onSort: (i, b) {},
            tooltip: 'display the product Quntity',
          ),
          DataColumn(
            label: Text('price'),
            numeric: false,
            onSort: (i, b) {},
            tooltip: 'display the product price',
          )
        ],
        rows: shipmentList
            .map((pro) => DataRow(cells: [
                  DataCell(Text(pro.proudctName)),
                  DataCell(Text(pro.proudctQty)),
                  DataCell(Text(pro.proudctPrice)),
                ]))
            .toList());

class MyProudct {
  String proudctName;
  String proudctPrice;
  String proudctQty;

  MyProudct({this.proudctName, this.proudctPrice, this.proudctQty});
}

var shipmentList = <MyProudct>[
  MyProudct(proudctName: 'iphonex', proudctPrice: '20000', proudctQty: '2'),
  MyProudct(
      proudctName: 'lenovo laptop', proudctPrice: '25000', proudctQty: '3'),
  MyProudct(proudctName: 'T-shirt nike', proudctPrice: '500', proudctQty: '1'),
  MyProudct(proudctName: 'iphonex', proudctPrice: '20000', proudctQty: '2'),
  MyProudct(
      proudctName: 'lenovo laptop', proudctPrice: '25000', proudctQty: '3'),
  MyProudct(proudctName: 'T-shirt nike', proudctPrice: '500', proudctQty: '1'),
];

class Checkoutbottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 3,
                child: Container(
                  height: MediaQuery.of(context).size.height * .08,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter your !",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.red),
                        enabledBorder: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.blue)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        )),
                  ),
                ),
              ),
              Flexible(
                  flex: 2,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .08,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                      color: Colors.blue,
                      child: Text('ADD CODE'),
                      onPressed: () {},
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: MediaQuery.of(context).size.height * .08,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
                color: Colors.blue,
                child: Text('PLACE ORDER'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Payment()));
                },
              ))
        ],
      ),
    );
  }
}

Widget shipmentFees(MainAxisAlignment jj) => Column(
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Sum'),
                  Text('Shipping fees'),
                  Text('Discount'),
                ],
              ), //Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text('3000 EGP'),
                  Text('300000 EGP'),
                  Text('30000 EGP'),
                ],
              ),
            ]),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'TOTAL AMOUNT',
              style: TextStyle(color: Colors.blue),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              '3000 EGP',
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      ],
    );
