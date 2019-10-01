import 'package:big/componets/shopping_icons.dart';
import 'package:flutter/material.dart';
import 'package:big/Providers/DataProvider.dart';
import '../componets/appBar.dart';
//my own imports
import '../componets/horizontal_listview.dart';
import '../componets/products.dart';
import '../componets/sort.dart';
import '../componets/filter.dart';
import 'package:big/model/Productsmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:big/model/Category.dart';


class SubCategory extends StatefulWidget {
  final String subtitle;
  final int catID;
  final List<Data> listOfProducts=[];

  SubCategory({Key key, @required this.subtitle,this.catID}) : super(key: key);
  @override
  _SubCategoryState createState() => _SubCategoryState(catId: catID);
}

class _SubCategoryState extends State<SubCategory> {
  int catId;
  String modalTitle;
  Filter filter = new Filter();
  Sort sort = new Sort();

  _SubCategoryState({this.catId});



//////////////////////////////////////////// fetch subCategories///////////////////////////
Future<List<Category>> fetchdata() async {  
    final res = await http.get("http://18.217.190.199/api/categories/$catId");
    List<Category> list;

    if (res.statusCode == 200) {

      var data = json.decode(res.body);
      var rest = data["data"]["children"] as List;
      list = rest.map<Category>((json) => Category.fromJson(json)).toList();
    }
    return list;
  }

String s="price";
String o="asc";
////////////////////////////////////////// fetch Products //////////////////////////////////
Future<List<Data>> fetchProatest() async {

  final res = await http.get("http://18.217.190.199/api/categories/4/products?sort=s&order=$o");
      List<Data> list = <Data>[];

  if (res.statusCode == 200) {
    print(res.statusCode.toString()+"Ahmed kotb");

    var data = json.decode(res.body);

    var restdata = data["data"];

    list = restdata.map<Data>((json) => Data.fromJson(json)).toList();
  

  }

  return list;

}














@override
void initState() { 
  super.initState();
}


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


  //MyStatefulWidget expand = new MyStatefulWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Mybar(widget.subtitle, true),
      body: new Column(
        children: <Widget>[
          HorizontalList(
            catId: catId,
            fet:fetchdata() ,
          ),
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
                                          context, 'Sort By', sort),
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
            catId,fetchProatest(),"name"

          )),
        ],
      ),
    );
  }
}















class Sort extends StatefulWidget {
  @override
  _SortState createState() => _SortState();
}

class _SortState extends State<Sort> {
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: <Widget>[
          _createTile(context, 'Top Selling', _action1),
          _createTile(context, 'Position', _action2),
          _createTile(context, 'Name', _action3),
          _createTile(context, 'Price', _action4),
        ],
      );
  }
}

ListTile _createTile(BuildContext context, String name, Function action) {
  return ListTile(
    title: Text(name),
    onTap: () {
      Navigator.pop(context);
      action();
      
      //SetState()
    },
  );
}

_action1() {
  print('action 1');
  
}

_action2() {
  print('action 2');
}

_action3() {
  print('action 3');
}

_action4() {
  print('action 4');
}
