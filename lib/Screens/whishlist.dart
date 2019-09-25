import 'package:big/Providers/ColorsProvider.dart';
import 'package:big/componets/appBar.dart';
import 'package:big/componets/products.dart';
import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  bool isFavorite = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Mybar("Wishlist", false,true),
      body: Column(children: <Widget>[
        Flexible(
          child: Products(),
        ),
      ]),
    );
  }
}
