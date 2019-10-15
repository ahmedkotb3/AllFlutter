import 'dart:convert';
import 'package:big/Providers/ColorsProvider.dart';
import 'package:big/Providers/DataProvider.dart';
import 'package:big/Screens/shipping.dart';
import 'package:big/componets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List productList = DataProvider().productes;
  int counter = 1;
  int itemPrice;
  int totalPrice = 0;
  Color iconColor = Colors.grey;
  bool isBagFull = true;
  String dropdownValue = 'Delete all Items';
  var key;
  var data;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (BuildContext context) => DataProvider(),
      child: Scaffold(
        appBar: Mybar("Your Bag", false, true),
        body: Consumer<DataProvider>(
              builder: (context, dataProvider, _) => FutureBuilder(
                future: DataProvider().CartDetails().then((res){
                  data=json.decode(res);}),
                builder: (context,snapshot){
                  if((snapshot.connectionState==ConnectionState.done)&&(data['data']['cartItems'].length>0)){
                    for( key in data['data']['cartItems'].keys)
                    {
                      print(key);
                    }
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: data['data']['cartItems'].keys.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                child: new FittedBox(
                                  child: Material(color: Colors.white,
                                      elevation: 14.0,
                                      borderRadius: BorderRadius.circular(24.0),
                                      shadowColor: Color(0x802196F3),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            width: 150.0,
                                            height: 218.0,
                                            child: ClipRRect(
                                              borderRadius: new BorderRadius.circular(24.0),
                                              child: Image(
                                                  fit: BoxFit.contain,
                                                  alignment: Alignment.topLeft,
                                                  image: NetworkImage(productList[index]['picture'])),
                                            ),
                                          ),
                                          Container(
                                            height: 218.0,
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 16.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Padding(padding: const EdgeInsets.only(right: 8.0),
                                                    child: Container(
                                                        child: Row(
                                                          children: <Widget>[
                                                            Container(
                                                                width: 200.0,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(8.0),
                                                                  child: Text(data['data']['cartItems']['$key']['name'], maxLines: 4, textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0),
                                                                  ),
                                                                )),
                                                          ],
                                                        )),
                                                  ),
                                                  Container(
                                                      child: Text(
                                                        "${data['data']['cartItems']['$key']['price']}", style: TextStyle(
                                                            color: ColorProvider().primary,fontSize: 25.0, fontWeight: FontWeight.bold),
                                                      )),
                                                  Container(
                                                    child: Row(
                                                      children: <Widget>[
                                                        IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              if (data['data']['cartItems']['$key']['qty'] > 1) {
                                                                DataProvider().CartEdite(key,data['data']['cartItems']['$key']['qty'] - 1);
                                                              }
                                                            });

                                                          },
                                                          icon: Icon(Icons.remove_circle), color: ColorProvider().primary, iconSize: 50.0,
                                                        ),
                                                        Text(
                                                          "${data['data']['cartItems']['$key']['qty']}", style: TextStyle(fontSize: 30.0),),
                                                        IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              DataProvider().CartEdite(key,data['data']['cartItems']['$key']['qty'] + 1);
                                                            });

                                                          },
                                                          icon: Icon(Icons.add_circle),
                                                          color: ColorProvider().primary, iconSize: 50.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 218,
                                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                IconButton(
                                                  icon: Icon(Icons.close),
                                                  iconSize: 40.0,
                                                  onPressed: () {
                                                    setState(() {
                                                      DataProvider().CartDelete(key);
                                                    });
                                                  },
                                                ),
//                                                IconButton(
//                                                  icon: Icon(Icons.favorite),
//                                                  iconSize: 40.0,
//                                                  color: iconColor,
//                                                  onPressed: () {
//                                                    setState(() {
//                                                      if (iconColor == Colors.grey) {iconColor = Colors.red;
//                                                      } else if (iconColor == Colors.red) {iconColor = Colors.grey;
//                                                      }
//                                                    });
//                                                  },
//                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text("Total Amount ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blue),
                                    ),
                                    Text("${data['data']['cartItems']['$key']['subtotal']} EGP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                                    ),
                                  ],
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Shipping()));
                                  },
                                  child: Text("CHECKOUT", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
                                  ),
                                  color: ColorProvider().primary,
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  }
                  else{
                    return Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("your Cart Is Empty",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.blue[900]),),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
        //   ],
        // ),
      ),
    );
  }
}
