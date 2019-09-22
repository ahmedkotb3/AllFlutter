import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DataProvider with ChangeNotifier {
 Color primary = Color (0xff193ca1);
 double paddingApp = 32.0;
 Color pperrywinkle = Color(0XFF7a90d6);
 bool securePassword = true;
  static List productList = [
    {
      "id": 1,
      "picture": "https://cf.shopee.ph/file/0e9e7987294e7b923ea5b5b19ae76b7b",
      "old_price": 150,
      "price": 25,
      "qty":1,
      "name":
          "Plus Button Back Guipure Lace Sleeve Belted Peplum TopPlus Button Back Guipure Lace Sleeve Belted Peplum TopPlus Button Back Guipure Lace Sleeve Belted Peplum Top",
      "isfav":true
    }
    ,
    {
      "id": 2,
      "picture":
          "https://vanheusenindia.imgix.net/img/app/product/2/298177-1307358.jpg",
      "old_price": 120,
      "price": 50,
      "qty":1,
      "name":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ut aliquet libero, sit amet feugiat eros. Quisque in ante augue. Nullam sed ",
      "isfave":false
    }
    ,
    {
      "picture":
          "https://allensolly.imgix.net/img/app/product/3/305159-1375189.jpg",
      "old_price": 150,
      "price": 100,
      "qty":1,
      "name":
          "laoreet enim vel, suscipit enim. Proin porta elit sed justo blandit, eu placerat leo elementum",
      "isfav":true
    }
  ];
   int cartItems=productList.length;
  get productes=>productList;

 set setPassword(bool check) {
  securePassword = check;
  notifyListeners();
 }

 bool get getPassword => securePassword;


}
