import 'package:big/Providers/ColorsProvider.dart';
import 'package:big/Screens/HomeScreen.dart';
import 'package:big/componets/horizontal_listview.dart';
import 'package:big/componets/shopping_icons.dart';
import 'package:flutter/material.dart';
import 'package:big/componets/appBar.dart';

class EmptyCart extends StatefulWidget {
  String pageTitle;
  EmptyCart(this.pageTitle);
  @override
  _EmptyCartState createState() => _EmptyCartState();
}

class _EmptyCartState extends State<EmptyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: Mybar("${widget.pageTitle}", false,false,true),
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
                        child: Text("${widget.pageTitle} Is Empty",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                      ),
                      widget.pageTitle == "Your Bag" 
                      ? (Icon(Shopping.emptybag,size: 60.0,color: Color(0XFF8ba4da),))
                      :Icon(Shopping.whislistempty,size: 60.0,color: Color(0XFF8ba4da),),
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
                                fit: BoxFit.fitWidth,
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
