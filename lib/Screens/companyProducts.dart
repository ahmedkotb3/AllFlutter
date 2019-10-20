import 'package:big/componets/shopping_icons.dart';
import 'package:flutter/material.dart';
import 'package:big/Providers/DataProvider.dart';
import '../componets/appBar.dart';
import 'package:big/model/Productsmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:big/SizeConfig.dart';
import 'package:big/Screens/details.dart';



class CompnayProduct extends StatefulWidget {
  int compId;
  String subtitle;
  CompnayProduct({Key key,this.subtitle,this.compId}) : super(key: key);

  _CompnayProductState createState() => _CompnayProductState();
}

class _CompnayProductState extends State<CompnayProduct> {
 int compId;
  String subtitle;
  _CompnayProductState({this.subtitle,this.compId});

    Future<List<Data>> fetchPro() async {
    final res = await http.get("http://18.217.190.199/api/company/1");
    List<Data> list = <Data>[];

    if (res.statusCode == 200) {
      var data = json.decode(res.body);

      var restdata = data["data"];

      list = restdata.map<Data>((json) => Data.fromJson(json)).toList();
    }

    return list;
  }
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Mybar(widget.subtitle, true),
      body: new Column(
        children: <Widget>[
          //padding widget
          Container(
            color: Color(0XFFf4f4f4),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(children: <Widget>[
                    Text('${DataProvider.productList.length} Items'),
                  ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text('Sort By'),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                            width: 1.0,
                                            color: Color(0xFFE5E3E3)),
                                      ),
                                    ),
                                   
                                  ),
                                )
                              ],
                            ),
                           
                          ],
                        ),
                      ]),
                ],
              ),
            ),
          ),
          //grid view
          Flexible(
              child: ProductsCompany(
          a:fetchPro()
          )),
        ],
      ),
    );
  }
}






class ProductsCompany extends StatefulWidget {
Future<List<Data>> a;
ProductsCompany({this.a});
  @override
  _ProductsCompanyState createState() =>
      _ProductsCompanyState(a: a);
}


class _ProductsCompanyState extends State<ProductsCompany> {
Future<List<Data>> a;

  
  _ProductsCompanyState({this.a});

  @override
  Widget build(BuildContext context,[bool isFavorite, ]) {
    SizeConfig().init(context);
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = ((size.height - kToolbarHeight - 24) * 0.5);
    final double itemWidth = size.width / 2;

    return FutureBuilder<List<Data>>(
      future:a,
      builder: (context, snapshot) {
        List<Data> productList = snapshot.data;

        return productList != null
            ? GridView.builder(
                itemCount: productList.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 5.0,
                    crossAxisCount: 2,
                    childAspectRatio: itemWidth / itemHeight),
                itemBuilder: (BuildContext context, int index) {
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
                                        Stack(
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
                                          image: NetworkImage(
                                              productList[index].cover)),
                                    ),
                                  ),
                                  onTap: () {
                                    print(productList[index].id);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetails(
                                                    productList[index].id)));
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
                                              new Text(
                                                " ${productList[index].price} \EGY ",
                                                style: new TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: SizeConfig
                                                            .safeBlockHorizontal *
                                                        3.5,
                                                    color: Color(0XFF161a28)),
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
                                              onPressed: () {}

                                              /*async {
                          var db = new DatabaseManager();
                          int insert = await db.saveProduct(
                            new Product(
                                'lcwkiki',
                                'njknjkjkjkjbjkbjkbjk',
                                'https://www.logaster.com/blog/wp-content/uploads/2013/06/jpg.png',
                                'EGY',
                                500,
                                300,
                                1,
                                1),
                          );
                          print("saved Product : $insert");
                          List myUsers =
                              await db.getAllUsers();
                          for (int i = 0;
                              i < myUsers.length;
                              i++) {
                            Product product =
                                Product.map(myUsers[i]);
                            print(
                                'ID: ${product.title} - username: ${product.description} - city: ${product.isFavorite}');
                          }
                        }*/

                                              ),
                                        ),
                                      ],
                                    ),
                                    new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                    children :<Widget>[ Text(
                                      "${productList[index].price}\EGY",
                                      style: TextStyle(
                                          color: Color(0XFF7f7f7f),
                                          fontWeight: FontWeight.w100,
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  2.5,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                    ]),
                                    new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            color: Colors.white,
                                            height:
                                                SizeConfig.safeBlockVertical *
                                                    4,
                                            child: Text(
                                              "${productList[index].name}",
                                              overflow: TextOverflow.ellipsis,
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: SizeConfig
                                                          .safeBlockVertical *
                                                      1.5,
                                                  color: Color(0XFF5d5e62)),
                                              maxLines: 2,
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
                })
            : Container(
                child: Center(
                child: Column(
                  children: <Widget>[
                    Text('Loading....'),
                    SizedBox(
                      height: 20,
                    ),
                    CircularProgressIndicator()
                  ],
                ),
              ));
      },
    );
  }
}