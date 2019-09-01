import 'package:flutter/material.dart';
import 'package:big/Providers/DataProvider.dart';
import 'package:big/componets/shopping_icons.dart';


AppBar appBar(String title) {
  final list = ["dnk", "ankdn", "kdnn", "ahmed"];
  return new AppBar(
    elevation: 0.1,
    backgroundColor: Colors.white,
    title: Row(
      children: <Widget>[
        new IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: DataProvider().primary,
          ),
          onPressed: () {},
        ),
        Text(
          title,
          style: TextStyle(color: DataProvider().primary),
        ),
      ],
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: new IconButton(
            icon: Icon(
              Icons.search,
              color: DataProvider().primary,
            ),
            onPressed: () {}),
      ),
      new Stack(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Shopping.shopping_bag_01,
              //Icons.shopping_cart,
              color: DataProvider().primary,
              //size: 50,
            ),
            onPressed: null,
          ),
          list.length == 0
              ? new Container()
              : new Positioned(
                top: 20,
                left: 5,
                  child: new Stack(
                  children: <Widget>[
                    new Icon(Icons.brightness_1, size: 20.0, color: Colors.red),
                    new Positioned(
                        top: 4.0,
                        right: 6.0,
                        child: new Center(
                          child: new Text(
                            list.length.toString(),
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 11.0,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ],
                )),
        ],
      ),
    ],
  );
}
