import 'package:big/Screens/SubCategory.dart';
import 'package:flutter/material.dart';
import 'package:big/componets/products.dart';

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
