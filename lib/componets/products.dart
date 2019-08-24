import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
      "description": "Plus Button Back Guipure Lace Sleeve Belted Peplum Top"
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
      "description": "Plus Button Back Guipure Lace Sleeve Belted Peplum Top"
    },
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
      "description": "Plus Button Back Guipure Lace Sleeve Belted Peplum Top"
    },
    {
      "name": "Red dress",
      "picture": "images/products/blazer1.jpeg",
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
            crossAxisCount: 2, childAspectRatio: 0.7),
        itemBuilder: (BuildContext context, int index) {
          return SingleProd(
            prodName: productList[index]['name'],
            prodPricture: productList[index]['picture'],
            prodOldPrice: productList[index]['old_price'],
            prodPrice: productList[index]['price'],
            prodDesc: productList[index]['description'],
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Stack(
          alignment: FractionalOffset.topLeft,
          children: <Widget>[
            new Positioned(
                top: 1.0,
                right: 10.0,
                child: new Stack(
                  children: <Widget>[
                    new Container(
                      width: 40,
                      height: 24,
                      color: Color(0XFFff2b2b),
                      transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                    ),
                    new Positioned(
                        bottom: 10,
                        left: 10,
                        child: new Center(
                          child: new Text(
                            "new",
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ],
                )),
            new Stack(
              alignment: FractionalOffset.bottomCenter,
              children: <Widget>[
                Stack(alignment: FractionalOffset.topRight, children: <Widget>[
                  new Container(
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage(prodPricture),
                    )),
                  ),
                ]),
                new Container(
                  height: 110.0,
                  color: Colors.white,
                  child: new Padding(
                    padding: const EdgeInsets.all(8.0),
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
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
