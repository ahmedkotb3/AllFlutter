//import 'package:big/componets/icons.dart';
import 'package:flutter/material.dart';
import 'package:big/Providers/DataProvider.dart';
//import  MyFlutterApp from 'package:big/componets/icons.dart';

AppBar appBar(String title) {

  final list = ["dnk", "ankdn", "kdnn","ahmed"];
  return new AppBar(
    elevation: 0.1,
    backgroundColor: Colors.white,
    title: Row(
      children: <Widget>[
        new IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: DataProvider().appBlue,
          ),
          onPressed: () {},
        ),
        Text(
          title,
          style: TextStyle(color: DataProvider().appBlue),
        ),
      ],
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: new IconButton(
            icon: Icon(
              Icons.search,
              color: DataProvider().appBlue,
            ),
            onPressed: () {}),
      ),
      new Stack(
        children: <Widget>[
          new IconButton(
            icon:  Icon(
              Icons.shopping_cart,
              //MyFlutterApp(shopping_bag_01),
              color:DataProvider().appBlue,
            ),
            onPressed: null,
          ),
          list.length == 0
              ? new Container()
              : new Positioned(
              child: new Stack(
                children: <Widget>[
                  new Icon(Icons.brightness_1,
                      size: 20.0,color:Colors.red),
                  new Positioned(
                      top: 5.0,
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