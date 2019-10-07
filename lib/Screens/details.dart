import 'dart:convert';
import 'package:big/Providers/ColorsProvider.dart';
import 'package:big/Screens/cart.dart';
import 'package:big/Widgets/dataManager.dart';
import 'package:big/componets/appBar.dart';
import 'package:big/componets/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:toast/toast.dart';
import '../componets/appBar.dart';
import '../Providers/DataProvider.dart';
import '../componets/slider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:provider/provider.dart';
import 'package:big/review/allReviews.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:big/model/Productsmodel.dart';
import 'package:path/path.dart';
class ProductDetails extends StatefulWidget {
 final int productID;
  ProductDetails(this.productID);
  @override
  _ProductDetailsState createState() =>
      _ProductDetailsState(productid: productID);
}



class _ProductDetailsState extends State<ProductDetails> {
  int productid;
  _ProductDetailsState({this.productid});


List<Data> myProduct;
List<Images> listImages = new List();
  List mydata;


    Future<dynamic> fetchPro() async {
    final res = await http.get("http://18.217.190.199/api/product/$productid");

        var data = json.decode(res.body);

          List<dynamic> images = data['data'][0]['images'];
        for (dynamic item in images) {
          listImages.add(Images.fromJson(item));
        }
         print(listImages[0].src);
        print(listImages.toString()+"aaaaaaaaaaaaaaaaaaaaooooooooppppaaa");

  if (res.statusCode == 200) {
      setState(() {
        var data = json.decode(res.body);
        mydata = data["data"];
        myProduct = mydata.map<Data>((json) => Data.fromJson(json)).toList();

        print(mydata.toString() + "dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      });
    }
     print('nnmnnnnnnnnnnnnnnnnnnnnnn'+data);

      
     // p = restdata.map<Product>((json) => Product.fromJson(json)).toList();

  
  }

  String dropdownValue = 'Black';
  String dropdownValue2 = 'S';
  String appBarTitle = "details";
  String productBrand = "LC WAIKIKI";
  String productDetails =
      "Plus Button Back Guipure Lace Sleeve Belted Peplum Top";
  String currency = "EGP";
  double productPrice = 700;
  double rating = 5;
  bool isNew = true;
  bool isFavorite = false;
  bool isOffer = true;
  Color favoriteColor = Colors.grey;
  var db = new DatabaseManager();

@override
void initState() { 
  super.initState();
  this.fetchPro();
}


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (BuildContext context) => DataProvider(),
      child: Scaffold(
          appBar: Mybar(appBarTitle, true),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: 
                   ListView(
                      children: <Widget>[
                        Container(
                          height: 240,
                          width: double.infinity,
                          child: silder(context,listImages),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Transform.translate(
                            offset: Offset(0.0, -25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                isNew
                                    ? Stack(
                                        children: <Widget>[
                                          Container(
                                            width: 40,
                                            height: 25,
                                            color: Colors.red,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text(
                                                "NEW",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Spacer(flex: 2),
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      decoration: new BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        border: new Border.all(color: Colors.grey), color: Colors.white,),
                                      width: 40,
                                      height: 40,
                                      child: new IconButton(
                                        icon: Icon(Icons.favorite),
                                        iconSize: 20.0,
                                        color: favoriteColor,
                                        onPressed: () {
                                          if ( favoriteColor == Colors.red) {
                                            setState(() {
                                              favoriteColor = Colors.grey;
                                           //   deleteFav(myProduct[0].id);
                                            });
                                          } else if ( favoriteColor == Colors.grey) {
                                            setState(()  {
                                              favoriteColor = Colors.red;
                                              addToFav();
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                             myProduct[0].name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: <Widget>[
                            new Expanded(
                              child: Text(
                               myProduct[0].name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorProvider().secondColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                new Text(
                              myProduct[0].price + "$currency",
                                  style: TextStyle(
                                    color: DataProvider().primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            Row(children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AllReviews()));
                                },
                                child: Text('(120) Review',style: TextStyle(fontSize: 14),),
                              ),
                              SmoothStarRating(
                                  allowHalfRating: false,
                                  // onRatingChanged: (v) {
                                  //   setState(() {
                                  //     rating = v;
                                  //   });
                                  // },
                                  starCount: 5,
                                  rating: 3,
                                  size: 18.0,
                                  color: Colors.yellow,
                                  borderColor: Colors.grey,
                                  spacing: 0.0),
                            ]),
                          ],
                        ),
                        if (isOffer)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                myProduct[0].price + "$currency",
                                style: TextStyle(
                                    color: ColorProvider().secondColor,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                            ],
                          ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border: new Border.all(color: Colors.grey),
                              ),
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: dropdownValue,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'Black',
                                    'Blue',
                                    'Red',
                                    'Yellow'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(value),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Container(
                              decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  border: new Border.all(color: Colors.grey)),
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: dropdownValue2,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue2 = newValue;
                                    });
                                  },
                                  items: <String>['S', 'M', 'L', 'XL', 'XXL']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(value),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        buildExpansionTile("Product Description", myProduct[0].description),
                        buildExpansionTile("Size Chart", "details"),
                        buildExpansionTile("shipping Terms", "details"),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 1.4,
                              height: 50.0,
                              child: RaisedButton(
                                color: ColorProvider().primary,
                                onPressed:()=> AddToCard(myProduct[0].id,1),
                                child: Text("ADD TO BAG", textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  
            ),
          )),
    );
  }
  AddToCard(int productId,int qty){
  DataProvider().CartPost(productId, qty).then((res){
    var data=json.decode(res);
    if(data['success']==true){
     // Toast.show("success", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
      //Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
    }

  });

  }
  Future addToFav()async{
  int ProductSaved = await db.saveProduct(new Product(
      myProduct[0].name,
      myProduct[0].description,
      myProduct[0].cover,
      2000,
      100,
      1,
      myProduct[0].id));
  print("saved user : $ProductSaved");
  print(myProduct[0].price);
  }
//  Future deleteFav(int Isfav)async{
//      int deleteCustmUser =await db.deleteProduct(Isfav);
//  print('delete user: $deleteCustmUser');
//  }
  }


  ExpansionTile buildExpansionTile(String header, String body) {
    return ExpansionTile(
      title: new Text(header),
      children: <Widget>[
        new Column(
          children: <Widget>[
            ListTile(
              title: Text(
                body,
                style: TextStyle(color: ColorProvider().secondColor),
              ),
            ),
          ],
        ),
      ],
    );

  }



