import 'package:flutter/material.dart';
import 'package:big/Providers/DataProvider.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Blazer",
      "picture": "lib/assets/images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
      "description": "Plus Button Back Guipure Lace Sleeve Belted Peplum Top"
    },
    {
      "name": "Blazer",
      "picture": "lib/assets/images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
      "description": "Plus Button Back Guipure Lace Sleeve Belted Peplum Top"
    },
    {
      "name": "Red dress",
      "picture": "lib/assets/images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
      "description": "Plus Button Back Guipure Lace Sleeve Belted Peplum Top"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 5.0, crossAxisCount: 2, childAspectRatio: 0.64),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: SingleProd(
              prodName: productList[index]['name'],
              prodPricture: productList[index]['picture'],
              prodOldPrice: productList[index]['old_price'],
              prodPrice: productList[index]['price'],
              prodDesc: productList[index]['description'],
            ),
          );
        });
  }
}

class SingleProd extends StatelessWidget {
  final prodName;
  final prodPricture;
  final prodOldPrice;
  final prodPrice;
  final prodDesc;

  SingleProd(
      {this.prodName,
      this.prodPricture,
      this.prodOldPrice,
      this.prodPrice,
      this.prodDesc});

  @override
  Widget build(BuildContext context) {
    return 
        Card(
          child: Column(
            children: <Widget>[
              new Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 160,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(prodPricture),
                )),
              ),
              new Container(
                color: Colors.white,
                child: new Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Column(
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                new Text(
                                  " $prodPrice \EGY ",
                                  style: new TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.0,
                                      color: Color(0XFF161a28)),
                                ),
                                new Text(
                                  "$prodOldPrice\EGY",
                                  style: TextStyle(
                                      color: Color(0XFF7f7f7f),
                                      fontWeight: FontWeight.w100,
                                      fontSize: 10.0,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ],
                            ),
                          ),
                          new IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: Color(0XFFdbdbdb),
                              ),
                              onPressed: () {}),
                        ],
                      ),
                      new Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "$prodDesc",
                              style: new TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.0,
                                  color: Color(0XFF5d5e62)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        child: RaisedButton(
                          color: DataProvider().primary,
                          onPressed: () {},
                          child: const Text('ADD TO BAG',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
  }
}
