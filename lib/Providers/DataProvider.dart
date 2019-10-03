import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'MainProvider.dart';
String productApi = "/product/";
String cartGetApi="/cart";
String ProductDetailsUrl = MainProvider().baseUrl + productApi ;
String CartUrl= MainProvider().baseUrl + cartGetApi;
class DataProvider with ChangeNotifier {
 Color primary = Color (0xff193ca1);
 double paddingApp = 32.0;
 Color pperrywinkle = Color(0XFF7a90d6);
 bool securePassword = true;
 var cookie="";
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
/////////////////////////////////////////////////////////////////////////////////////////
  Future<String> productDetails(int Id) async {
    Response response = await http.get(ProductDetailsUrl+ Id.toString());
    int statusCode = response.statusCode;
    print("statusCode:${statusCode}");
    var body = json.decode(response.body);
     // print('body $body');
    return response.body;
  }
////////////////////////cart///////////////////////////////////////////////////////////////
  Future<String> CartDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var cookie = await prefs.getString('cookie');
    print(cookie);
    final headers = {'Content-Type': 'application/json','Cookie': "$cookie" };
    Response response = await http.get(CartUrl,headers: headers);
    int statusCode = response.statusCode;
    print("statusCode get cart:${statusCode}");
    var body = json.decode(response.body);
    print('body get cart $body');
    return response.body;
  }
  Future<String> CartPost(int product,int quantity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var cookie = await prefs.getString('cookie');
    print(cookie);
    final headers = {'Content-Type': 'application/json','Cookie': "$cookie" };
    Map<String, int> body = {'product': product, 'quantity': quantity};
    String jsonBody = json.encode(body);
    Response response = await http.post(CartUrl,body: jsonBody,headers: headers);
    int statusCode = response.statusCode;
    print("statusCode POSTtttttttttttttttttttttttt cart:${statusCode}");
    var s = json.decode(response.body);
    print('body POST cart $s');
    return response.body;
  }

}
