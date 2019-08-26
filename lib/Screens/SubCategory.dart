import 'package:flutter/material.dart';
import '../componets/appBar.dart';
//my own imports
import '../componets/horizontal_listview.dart';
import '../componets/products.dart';
import '../componets/modal.dart';
import '../componets/modal - Copy.dart';

class SubCategory extends StatefulWidget {
  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  String title = "Fashion";
  Modal modal = new Modal();
  Widget header() => Ink(
        child: Container(
          decoration: BoxDecoration(
             color: Color(0XFF737373),
              border: Border(
            bottom: BorderSide(
                width: 1.0, color: Color(0xFF5d5e62).withOpacity(0.3)),
          )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Filter',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Color(0XFF193ca1),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
  void _mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Material(
            clipBehavior: Clip.antiAlias,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.only(
                    topLeft: new Radius.circular(15.0),
                    topRight: new Radius.circular(15.0))),
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 3.0, left: 3.0, bottom: 1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //mainAxisSize: MainAxisSize.max,
                //  mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: header(),
                  ),
                  Expanded(
                      child: ListView(
                    children: <Widget>[
                      Filter(),
                    ],
                  ))
/*                   Expanded(
                  child: ListView.builder(
                    //shrinkWrap: false,
                    //itemCount: menu.items.length,
                    itemBuilder: (context, i) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Filter(),
                        ),
                  ),
                ), */
                ],
              ),
            ),
          );
        });
  }

  //MyStatefulWidget expand = new MyStatefulWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title),
      body: new Column(
        children: <Widget>[
          HorizontalList(),
          //padding widget
          Container(
            color: Color(0XFFf4f4f4),
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
                                      onPressed: () =>
                                          modal.mainBottomSheet(context),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('Filter'),
                                IconButton(
                                  icon: Icon(Icons.filter),
                                  onPressed: () => _mainBottomSheet(context),
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
          Flexible(child: Products()),
        ],
      ),
    );
  }
}
