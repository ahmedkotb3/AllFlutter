import 'package:big/Providers/ColorsProvider.dart';
import 'package:big/componets/horizontal_listview.dart';
import 'package:flutter/material.dart';

class EmptyCart extends StatefulWidget {
  @override
  _EmptyCartState createState() => _EmptyCartState();
}

class _EmptyCartState extends State<EmptyCart> {
  String dropdownValue = 'Delete all Items';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              color: ColorProvider().primary,
              onPressed: () {},
            ),
            new Text(
              "Your Bag",
              style: TextStyle(color: ColorProvider().primary),
            ),
            DropdownButton<String>(
              icon: Icon(Icons.more_vert),
//              value: dropdownValue,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items:<String>['Delete all Items']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
                  .toList(),
            )

          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                //color: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Your Bag Is Empty",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                      ),
                      Image.network(
                          "https://assets.localcoinatm.com/images/wp-content/uploads/2018/10/18160316/100x100-shopping-cart-icon-01.png"
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[Text("new arrived",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),)],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.7,
                      //color: Colors.grey,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        elevation: 5.0,
                        child: Wrap(
                          children: <Widget>[
                            Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://sf2.mariefranceasia.com/wp-content/uploads/sites/7/2017/04/fashion-200x200.jpg")),
                            ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "500 EGP",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "700 EGP",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: ColorProvider().secondColor,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  InkWell(
                                    child: Icon(
                                      Icons.favorite,
                                      color: ColorProvider().secondColor,
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                children: <Widget>[
                                  Expanded(child: Text("mohamed essam")),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "ADD TO BAG",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: ColorProvider().primary,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),Container(
                      width: MediaQuery.of(context).size.width / 1.7,
                      //color: Colors.grey,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        elevation: 5.0,
                        child: Wrap(
                          children: <Widget>[
                            Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://sf2.mariefranceasia.com/wp-content/uploads/sites/7/2017/04/fashion-200x200.jpg")),
                            ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "500 EGP",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "700 EGP",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: ColorProvider().secondColor,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  InkWell(
                                    child: Icon(
                                      Icons.favorite,
                                      color: ColorProvider().secondColor,
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                children: <Widget>[
                                  Expanded(child: Text("mohamed essam")),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "ADD TO BAG",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: ColorProvider().primary,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),Container(
                      width: MediaQuery.of(context).size.width / 1.7,
                      //color: Colors.grey,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        elevation: 5.0,
                        child: Wrap(
                          children: <Widget>[
                            Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://sf2.mariefranceasia.com/wp-content/uploads/sites/7/2017/04/fashion-200x200.jpg")),
                            ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "500 EGP",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "700 EGP",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: ColorProvider().secondColor,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  InkWell(
                                    child: Icon(
                                      Icons.favorite,
                                      color: ColorProvider().secondColor,
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                children: <Widget>[
                                  Expanded(child: Text("mohamed essam")),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "ADD TO BAG",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: ColorProvider().primary,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
