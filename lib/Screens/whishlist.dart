import 'package:big/Providers/ColorsProvider.dart';
import 'package:big/componets/products.dart';
import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  bool isFavorite = true;
  String dropdownValue = 'Delete all Items';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              color: ColorProvider().primary,
              onPressed: () {},
            ),
            new Text(
              "Wishlist",
              style: TextStyle(color: ColorProvider().primary),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: Icon(Icons.more_vert),
//              value: dropdownValue,
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['Delete all Items']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(children: <Widget>[
        Flexible(
          child: Products(),
        ),
      ]),
    );
  }
}
