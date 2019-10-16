import 'package:big/Providers/ColorsProvider.dart';
import 'package:big/Providers/DataProvider.dart';
import 'package:big/Screens/details.dart';
import 'package:big/Widgets/dataManager.dart';
import 'package:big/componets/appBar.dart';
import 'package:big/componets/products.dart';
import 'package:big/model/Productsmodel.dart';
import 'package:flutter/material.dart';
import 'package:big/SizeConfig.dart';


class Wishlist extends StatefulWidget {

  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  String title = "Wishlist";
  List productList = DataProvider.productList;
  int val = 25;
  List ProductDb;
  int productCounter;
  var db = DatabaseManager();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = ((size.height - kToolbarHeight - 24) * 0.5);
    final double itemWidth = size.width / 2;
    return Scaffold(
        appBar: Mybar(title, false, true),
        body: FutureBuilder(
          future:  getDataBase(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.done){
              return GridView.builder(
                  itemCount:productCounter,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 5.0,
                      crossAxisCount: 2,
                      childAspectRatio: itemWidth / itemHeight),
                  itemBuilder: (BuildContext context, int index) {
                    Product product = Product.map(ProductDb[index]);
                    return Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Container(
                          child: Card(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                    child: new Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          if(product.isNew==1) Stack(
                                      children: <Widget>[
                                        Transform.translate(
                                          offset: Offset(-10.0, -10.0),
                                          child: Container(
                                            width: 45.0,
                                            height: 20.0,
                                            color: Color(0XFFff2b2b),
                                            child: Text(
                                              "New",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                        ],
                                      ),
                                      height: SizeConfig.safeBlockVertical * 25,
                                      decoration: new BoxDecoration(
                                        image: new DecorationImage(
                                            fit: BoxFit.contain,
                                            image: NetworkImage("${product.imageUrl}")),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ProductDetails(product.productID)));
                                    }),
                                new Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      new Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                new Text("50",
                                                  style: new TextStyle(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: SizeConfig
                                                          .safeBlockHorizontal *
                                                          3.5,
                                                      color: Color(0XFF161a28)),
                                                ),
                                                new Text(product.price.toString(),
                                                  style: TextStyle(
                                                      color: Color(0XFF7f7f7f),
                                                      fontWeight: FontWeight.w100,
                                                      fontSize: SizeConfig.safeBlockHorizontal * 2.5, decoration: TextDecoration.lineThrough),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: SizeConfig.safeBlockVertical *
                                                5.0,
                                            padding: EdgeInsets.all(0.0),
                                            child: new IconButton(
                                                iconSize: 20.0,
                                                padding:
                                                const EdgeInsets.all(0.0),
                                                alignment: Alignment.center,
                                                icon: Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    deleteFav(product.productID);
                                                  });
                                                }
                                            ),
                                          ),
                                        ],
                                      ),
                                      new Row(crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              color: Colors.white,
                                              height: SizeConfig.safeBlockVertical * 4,
                                              child: Text(product.description, overflow: TextOverflow.ellipsis,
                                                style: new TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: SizeConfig.safeBlockVertical * 1.5,
                                                    color: Color(0XFF5d5e62)), maxLines: 2,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
                  }
              );
            }
            else {
              return  CircularProgressIndicator();
            }
          },
        )
    );
  }

  Future getDataBase() async {
    productCounter=await db.getCount();
      ProductDb = await db.getAllUsers();
    for (int i = 0; i < ProductDb.length; i++) {
      Product product = Product.map(ProductDb[i]);
      print('user id=${product.id} username:${product.imageUrl} username:${product.description}');
      print('-----------------------------');
    }
  }
  Future deleteFav(int id)async{
    int deleteCustmProduct =await db.deleteProduct(id);
    print('delete user: $deleteCustmProduct');
  }
}