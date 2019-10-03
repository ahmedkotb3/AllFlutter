import 'package:big/Screens/SubSubCategory.dart';
import 'package:big/model/Productsmodel.dart';
import 'package:flutter/material.dart';
import 'package:big/componets/products.dart';

class Sort extends StatefulWidget {
 
  @override
  _SortState createState() => _SortState();
}

class _SortState extends State<Sort> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _createTile(context, 'Top Selling', ()=>Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => SubSubCategory(
                catID: 4,
                subtitle: "a",
                sorttype: "name",
                ordertype: "asc",
                
              )))),
        _createTile(context, 'Position', _action2),
        _createTile(context, 'Name', _action3),
        _createTile(context, 'Price', _action3),
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
