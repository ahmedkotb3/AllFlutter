import 'package:flutter/material.dart';
import '../componets/appBar.dart';
//my own imports
import '../componets/horizontal_listview.dart';
import '../componets/products.dart';

class SubCategory extends StatefulWidget {
  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  String title="Fashion";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title),
      body: new ListView(
        children: <Widget>[
          HorizontalList(),
          //padding widget
          Container(
            color: Colors.grey[200],
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(children: <Widget>[
                    Text('600 Items'),
                  ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text('Sort By'),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                            width: 1.0,
                                            color: Color(0xFFE5E3E3)),
                                      ),
                                    ),
                                    child: IconButton(
                                        icon: Icon(Icons.sort),
                                        onPressed: () {}),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('Filter'),
                                IconButton(
                                  icon: Icon(Icons.filter),
                                  onPressed: () {},
                                ),
                              ],
                            )
                          ],
                        ),
                      ]),
                ],
              ),
            ),
          ),

          //grid view
          Container(
            height: 180.0,
            child: Products(),
          )
        ],
      ),
    );
  }


}