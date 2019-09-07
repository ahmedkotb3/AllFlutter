import 'package:big/Screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:big/Providers/DataProvider.dart';
import 'package:big/componets/shopping_icons.dart';
import 'package:big/Screens/emptyCart.dart';




AppBar Mybar (String titleA,bool searchCartA,[bool deleteItemsA=false])  {
  String title=titleA;
  bool searchCart=searchCartA;
  bool deleteItems=deleteItemsA;
  BuildContext context;
    return new AppBar(
      elevation: 0.1,
      backgroundColor: Colors.white,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: DataProvider().primary,
            ),
            onPressed: () => Navigator.of(context).pop(),
          );
        },
      ),
      title: Row(
        children: <Widget>[
          new Text(
            title,
            style: TextStyle(color: DataProvider().primary),
          ),
        
    
      ]),


        actions: 
        
        <Widget>[
           deleteItems?Dropdown():Container(),
          
          searchCart?SearchCart():Container()]
        
      
    );
  }

class SearchCart extends StatefulWidget {
  @override
  _SearchCartState createState() => _SearchCartState();
}

class _SearchCartState extends State<SearchCart> {
  final list = ["dnk", "ankdn", "kdnn", "ahmed"];
  @override
  Widget build(BuildContext context) {
    return Row(children:<Widget>[
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
              onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => CartPage()));
                  },
            ),
            list.length == 0
                ? new Container()
                : new Positioned(
                    top: 20,
                    left: 5,
                    child: new Stack(
                      children: <Widget>[
                        new Icon(Icons.brightness_1,
                            size: 20.0, color: Colors.red),
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
      ]);
  }
}

 class Dropdown extends StatefulWidget {
    @override
    _DropdownState createState() => _DropdownState();
  }
  
  class _DropdownState extends State<Dropdown> {

    String dropdownValue="Delete All Items";
 
    @override
    Widget build(BuildContext context) {
      
      
      return DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: Icon(Icons.more_vert),
                value: null,
                 onChanged: (String newValue) {
                   setState(() {
                     dropdownValue = newValue;
                   });
                 },
                 items:<String>['Delete all Items']
                     .map<DropdownMenuItem<String>>((String value) {
                   return DropdownMenuItem<String>(
                     value: value,
                     child: InkWell(child: Text(value),
                       onTap: (){
                         Navigator.of(context).pushReplacement(
                             new MaterialPageRoute(builder: (context) => new EmptyCart()));
                       },
                     ),
                   );
                 })
                     .toList(),
               ),
      );
  }
  }
