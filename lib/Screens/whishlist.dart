import 'package:big/Providers/ColorsProvider.dart';
import 'package:big/Providers/DataProvider.dart';
import 'package:big/componets/appBar.dart';
import 'package:big/componets/products.dart';
import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {

  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  String title="Wishlist";
  List productList = DataProvider.productList;
  int val=25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Mybar(title, false,true),
      body: ListView.builder(
        itemCount: DataProvider().cartItems,
        itemBuilder: (BuildContext context,int index){
          return  ListTile(
             title: Text("${productList[index]['price']}"),
          );

        }

      ),
    );
  }
}
