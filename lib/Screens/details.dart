import 'package:big/componets/appBar.dart';
import 'package:big/componets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../componets/appBar.dart';
import '../Providers/DataProvider.dart';
import '../componets/slider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (BuildContext context) => DataProvider(),
      child: Scaffold(
        appBar: appBar("title"),
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                 Container(
                   height: 180,
                   width: double.infinity,
                   child: silder(),
                 ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Transform.translate(
                      offset: Offset(0.0, -25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Container(
                                width: 40,
                                height: 25,
                                color: Colors.red,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Text("NEW",
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
                          ),
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
                                  onPressed: (){},
                                    icon: Icon(Icons.favorite),
                                  iconSize: 20.0,
                                  color: Colors.grey,
                                )
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
                        Text("LC WAIKIKI",style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2
                        ),
                        ),
                      ],
                    ),
                  Row(
                    children: <Widget>[
                      new Expanded(
                        child: Text("Plus Button Back Guipure Lace Sleeve Belted Peplum Top",textAlign: TextAlign.center,style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          new Text("500 EGP",
                            style: TextStyle(
                              color: DataProvider().appBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                        ],
                      ),
                      SmoothStarRating(
                          allowHalfRating: false,
                          onRatingChanged: (v) {
                            setState(() {
                            });
                          },
                          starCount: 5,
                          rating: 4,
                          size: 25.0,
                          color: Colors.yellow,
                          borderColor: Colors.grey,
                          spacing:0.0
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("700 EGP",style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                            border: new Border.all(color: Colors.grey),
                        ),
                        width: MediaQuery.of(context).size.width/2.2,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>['One', 'Two', 'Free', 'Four']
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
                            border: new Border.all(color: Colors.grey)
                        ),
                        width: MediaQuery.of(context).size.width/2.2,
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>['One', 'Two', 'Free', 'Four']
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
                    ],
                  ),
                  ExpansionTile(
                   title: new Text("List"),
                    children: <Widget>[
                      new Column(
                        children: <Widget>[
                         ListTile(
                           title: Text("mohamed"),
                         ),
                        ],
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: new Text("List"),
                    children: <Widget>[
                      new Column(
                        children: <Widget>[
                          ListTile(
                            title: Text("mohamed"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: new Text("List"),
                    children: <Widget>[
                      new Column(
                        children: <Widget>[
                          ListTile(
                            title: Text("mohamed"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: new Text("List"),
                    children: <Widget>[
                      new Column(
                        children: <Widget>[
                          ListTile(
                            title: Text("mohamed"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width/1.4,
                        height: 50.0,
                        child: RaisedButton(
                          color:Colors.blueAccent,
                          onPressed: (){},
                          child: Text("ADD TO BAG",textAlign: TextAlign.center,style: TextStyle(
                            color: Colors.white,
                          ),
                          ),

                        ),
                      ),
                    ],
                  ),
                        ],
                      ),
                  )
              ),
            ),
    );
  }
}
