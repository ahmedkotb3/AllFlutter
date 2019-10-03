import 'package:big/componets/shopping_icons.dart';
import 'package:flutter/material.dart';
import 'package:big/Providers/DataProvider.dart';
import '../componets/appBar.dart';
//my own imports
import '../componets/horizontal_listview.dart';
import '../componets/products.dart';
import '../componets/sort.dart';
import '../componets/filter.dart';

class SubSubCategory extends StatefulWidget {
  final String subtitle;
  final int catID;
  final String sorttype;
  final String ordertype;

  SubSubCategory({
    Key key,
    this.sorttype,
    this.ordertype,
    @required this.subtitle,
    this.catID,
  }) : super(key: key);
  @override
  _SubSubCategoryState createState() => _SubSubCategoryState(
      catId: catID, sorttype: sorttype, ordertype: ordertype);
}

class _SubSubCategoryState extends State<SubSubCategory> {
  int catId;
  final String sorttype;
  final String ordertype;
  String modalTitle;
  Filter filter = new Filter();

  _SubSubCategoryState({this.catId, this.sorttype, this.ordertype});

//////////////////// header of fuckn list //////////////
  Widget header(modalTitle) => Ink(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                modalTitle,
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
//////////////////////////////////////////////////////////

  Widget sortwidget() => Column(
        children: <Widget>[
          _createTile(
              context,
              'A To Z',
              () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SubSubCategory(
                            catID: catId,
                            subtitle: "a",
                            sorttype: "name",
                            ordertype: "asc",
                          )))),
          _createTile(
              context,
              'Low price',
              () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SubSubCategory(
                            catID: catId,
                            subtitle: "a",
                            sorttype: "price",
                            ordertype: "asc",
                          )))),
          _createTile(
              context,
              'Top Price',
              () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SubSubCategory(
                            catID: catId,
                            subtitle: "a",
                            sorttype: "price",
                            ordertype: "desc",
                          )))),
          _createTile(
              context,
              'Top Rating',
              () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SubSubCategory(
                            catID: catId,
                            subtitle: "a",
                            sorttype: "rate",
                            ordertype: "desc",
                          )))),
        ],
      );

  ListTile _createTile(BuildContext context, String name, Function action) {
    return ListTile(
      title: Text(name),
      onTap: () {
        Navigator.pop(context);
        action();
      },
    );
  }

/////////////////////////// fucken footer for filter

  Widget footer() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlineButton(
                child: Text('Reset'),
                color: DataProvider().primary,
                borderSide: BorderSide(color: DataProvider().primary),
                onPressed: () {},
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: RaisedButton(
              color: DataProvider().primary,
              onPressed: () {},
              child: const Text('Apply', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      );

  /////////////////
  void _mainBottomSheet(BuildContext context, String name, Widget widget,
      [Widget footer]) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Color(0XFF737373),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Material(
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
                      header(name),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                          top: BorderSide(
                              width: 1.0,
                              color: Color(0xFF5d5e62).withOpacity(0.3)),
                          bottom: BorderSide(
                              width: 1.0,
                              color: Color(0xFF5d5e62).withOpacity(0.3)),
                        )),
                        child: ListView(
                          children: <Widget>[
                            widget,
                          ],
                        ),
                      )),
                      if (footer != null) footer
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

//////////////////// row of options like sort and filter
  //MyStatefulWidget expand = new MyStatefulWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Mybar(widget.subtitle, true),
      body: new Column(
        children: <Widget>[
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
                    Text('${DataProvider.productList.length} Items'),
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
                                      icon: Icon(Shopping.swap_vertical),
                                      onPressed: () => _mainBottomSheet(
                                          context, 'Sort By', sortwidget()),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text('Filter'),
                                IconButton(
                                  icon: Icon(
                                    Shopping.path_263,
                                    size: 20.0,
                                  ),
                                  onPressed: () => _mainBottomSheet(
                                      context, 'Filter', filter, footer()),
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
          Flexible(
              child: Products(
            catId: catId,
            sorttype: sorttype,
            ordertype: ordertype,
          )),
        ],
      ),
    );
  }
}
