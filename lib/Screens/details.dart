import 'dart:convert';

import 'package:big/Providers/ColorsProvider.dart';
import 'package:big/Screens/cart.dart';
import 'package:big/componets/appBar.dart';
import 'package:big/componets/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../componets/appBar.dart';
import '../Providers/DataProvider.dart';
import '../componets/slider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:provider/provider.dart';
import 'package:big/review/allReviews.dart';

class ProductDetails extends StatefulWidget {
  final product;
  ProductDetails({Key key,this.product}): super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String dropdownValue = 'Black';
  String dropdownValue2 = 'S';
  String appBarTitle = "details";
  String productBrand = "LC WAIKIKI";
  String productDetails = "Plus Button Back Guipure Lace Sleeve Belted Peplum Top";
  String currency="EGP";
  double productPrice = 700;
  double rating = 5;
  bool isNew = true;
  bool isFavorite = false;
  bool isOffer = true;
  Color favoriteColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (BuildContext context) => DataProvider(),
      child: Scaffold(
        appBar: Mybar(appBarTitle,true),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Container(
                height: 240,
    width:double.infinity,
                child: silder(context),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Transform.translate(
                  offset: Offset(0.0, -25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      isNew
                          ? Stack(
                              children: <Widget>[
                                Container(
                                  width: 40,
                                  height: 25,
                                  color: Colors.red,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: new Text(
                                      "NEW",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Spacer(flex: 2),
                      Stack(
                        children: <Widget>[
                          Container(
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border: new Border.all(color: Colors.grey),
                              color: Colors.white,
                            ),
                            width: 40,
                            height: 40,
                            child: new IconButton(
                              icon: Icon(Icons.favorite),
                              iconSize: 20.0,
                              color: favoriteColor,
                              onPressed: () {
                                if (isFavorite == true) {
                                  setState(() {
                                    favoriteColor = Colors.grey;
                                    isFavorite = false;
                                  });
                                } else if (isFavorite == false) {
                                  setState(() {
                                    favoriteColor = Colors.red;
                                    isFavorite = true;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    productBrand,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  new Expanded(
                    child: Text(
                      widget.product['name'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorProvider().secondColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      new Text(
                        "${widget.product['price']} $currency",
                        style: TextStyle(
                          color: DataProvider().primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                    ],
                  ),
                  Row(children:<Widget>[
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AllReviews()));
                    },
                    child:Text('(120) Review'),),
                 
                    SmoothStarRating(
                        allowHalfRating: false,
                        // onRatingChanged: (v) {
                        //   setState(() {
                        //     rating = v;
                        //   });
                        // },
                        starCount: 5,
                        rating: 3,
                        size: 25.0,
                        color: Colors.yellow,
                        borderColor: Colors.grey,
                        spacing: 0.0),
                  ]),
                ],
              ),
              if (isOffer)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${widget.product['old_price']} $currency" ,
                      style: TextStyle(
                          color: ColorProvider().secondColor,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ],
                ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: new Border.all(color: Colors.grey),
                    ),
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['Black', 'Blue', 'Red', 'Yellow']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(value),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Container(
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: new Border.all(color: Colors.grey)),
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue2,
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue2 = newValue;
                          });
                        },
                        items: <String>['S', 'M', 'L', 'XL', 'XXL']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(value),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              buildExpansionTile("Product Description", "details"),
              buildExpansionTile("Size Chart", "details"),
              buildExpansionTile("shipping Terms", "details"),
              buildExpansionTile("Product Description", "details"),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.4,
                    height: 50.0,
                    child: RaisedButton(
                      color: ColorProvider().primary,
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => CartPage()));

                      },
                      child: Text(
                        "ADD TO BAG",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }

  ExpansionTile buildExpansionTile(String header, String body) {
    return ExpansionTile(
      title: new Text(header),
      children: <Widget>[
        new Column(
          children: <Widget>[
            ListTile(
              title: Text(
                body,
                style: TextStyle(color: ColorProvider().secondColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
