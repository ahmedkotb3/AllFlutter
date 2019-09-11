import 'package:big/Providers/ColorsProvider.dart';
import 'package:big/Providers/DataProvider.dart';
import 'package:big/Screens/checkout.dart';
import 'package:big/componets/appBar.dart';
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
  Color iconColor=Colors.grey;
  bool isBagFull = true;
  String dropdownValue = 'Delete all Items';

  initState() {
    for(int i=0;i<productList.length;i++){
      totalPrice+=productList[i]['price'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        builder: (BuildContext context) => DataProvider(),
          child: Scaffold(
        appBar: Mybar("Your Bag",false,true),
//       appBar: AppBar(
//         title: new Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             IconButton(
//               icon: Icon(Icons.arrow_back),
//               color: ColorProvider().primary,
//               onPressed: () {},
//             ),
//             new Text(
//               "Your Bag",
//               style: TextStyle(color: ColorProvider().primary),
//             ),
//             DropdownButton<String>(
//               icon: Icon(Icons.more_vert),
// //              value: dropdownValue,
//               onChanged: (String newValue) {
//                 setState(() {
//                   dropdownValue = newValue;
//                 });
//               },
//               items:<String>['Delete all Items']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: InkWell(child: Text(value),
//                     onTap: (){
//                       Navigator.of(context).pushReplacement(
//                           new MaterialPageRoute(builder: (context) => new EmptyCart()));
//                     },
//                   ),
//                 );
//               })
//                   .toList(),
//             )

//           ],
//         ),
//         backgroundColor: Colors.white,
//       ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "Total Amount ",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    Text(
                      "$totalPrice EGP",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                  ],
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Checkout()));},
                  child: Text(
                    "CHECKOUT",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                  color: ColorProvider().primary,
                ),
              ],
            ),
          ),
        ),
        body: Consumer<DataProvider>(
          builder: (context, dataProvider, _) => ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: DataProvider().cartItems,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: new FittedBox(
                        child: Material(
                            color: Colors.white,
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
                                    borderRadius:
                                        new BorderRadius.circular(24.0),
                                    child: Image(
                                        fit: BoxFit.contain,
                                        alignment: Alignment.topLeft,
                                        image: NetworkImage(
                                            productList[index]['picture'])),
                                  ),
                                ),
                                Container(
                                  height: 218.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Container(
                                              child: Row(
                                            children: <Widget>[
                                              Container(
                                                  width: 200.0,
                                                  child: Padding(padding: const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      productList[index]
                                                          ['name'],
                                                      maxLines: 4,
                                                      textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0),
                                                    ),
                                                  )),
                                            ],
                                          )),
                                        ),
                                        Container(
                                            child: Text(
                                          "${productList[index]['price']}",
                                          style: TextStyle(
                                              color: ColorProvider().primary,
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              IconButton(
                                                onPressed: () {
                                                  if (counter > 1) {
                                                    setState(() {
                                                      counter--;
                                                      itemPrice = productList[index]['price'] * counter;
                                                      print("lluuuuuuuuuuuuul**$totalPrice");
                                                      totalPrice -= productList[index]['price'];
                                                    });
                                                  }
                                                },
                                                icon: Icon(Icons.remove_circle),
                                                color: ColorProvider().primary,
                                                iconSize: 50.0,
                                              ),
                                              Text("${counter}", style: TextStyle(fontSize: 30.0),),
                                              IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    counter++;
                                                    itemPrice = productList[index]['price'] * counter;
                                                    print("lluuuuuuuuuuuuul**$totalPrice");
                                                    totalPrice += productList[index]['price'];
                                                  });
                                                },
                                                icon: Icon(Icons.add_circle),
                                                color: ColorProvider().primary,
                                                iconSize: 50.0,
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
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.close),
                                        iconSize: 40.0,
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.favorite),
                                        iconSize: 40.0,
                                        color: iconColor,
                                        onPressed: () {
                                          setState(() {
                                            if(iconColor==Colors.grey){
                                              iconColor=Colors.red;
                                            }
                                            else if(iconColor==Colors.red){
                                              iconColor=Colors.grey;
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
