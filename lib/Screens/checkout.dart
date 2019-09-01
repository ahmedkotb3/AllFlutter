import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
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
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
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
                            '236 - xyz st, San Francisco, CA \n Alexandria ,Egypt.')
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
                  child: shipmentFees(),
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
                onPressed: () {},
              ))
        ],
      ),
    );
  }
}

Widget shipmentFees() => Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text('Sum'),
            SizedBox(
              width: 20,
            ),
            Text('3000 EGP')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text('Shipping fees'),
            SizedBox(
              width: 20,
            ),
            Text('3000 EGP')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text('Discount'),
            SizedBox(
              width: 20,
            ),
            Text('3000 EGP')
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text('TOTAL AMOUNT',style: TextStyle(color: Colors.blue),),
            SizedBox(
              width: 20,
            ),
            Text('3000 EGP',style: TextStyle(color: Colors.red),)
          ],
        ),
      ],
    );