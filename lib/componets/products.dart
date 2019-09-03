import 'package:big/Screens/details.dart';
import 'package:flutter/material.dart';
import 'package:big/Providers/DataProvider.dart';
import 'package:big/SizeConfig.dart';

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
      "description":
          "Plus Button Back Guipure Lace Sleeve Belted Peplum TopPlus Button Back Guipure Lace Sleeve Belted Peplum TopPlus Button Back Guipure Lace Sleeve Belted Peplum Top",
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
  Widget build(BuildContext context, [bool isFavorite]) {
    SizeConfig().init(context);
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = ((size.height - kToolbarHeight - 24) * 0.5);
    final double itemWidth = size.width / 2;

    return GridView.builder(
        itemCount: productList.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 5.0,
            crossAxisCount: 2,
            childAspectRatio: itemWidth / itemHeight),
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

  SingleProd({
    this.prodName,
    this.prodPricture,
    this.prodOldPrice,
    this.prodPrice,
    this.prodDesc,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Card(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              child: new Container(
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
                height: SizeConfig.safeBlockVertical * 25,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(prodPricture),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductDetails()));
              },
            ),
            new Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            new Text(
                              " $prodPrice \EGY ",
                              style: new TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                                  color: Color(0XFF161a28)),
                            ),
                            new Text(
                              "$prodOldPrice\EGY",
                              style: TextStyle(
                                  color: Color(0XFF7f7f7f),
                                  fontWeight: FontWeight.w100,
                                  fontSize: SizeConfig.safeBlockHorizontal * 2.5,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: SizeConfig.safeBlockVertical*5.0,
                        padding: EdgeInsets.all(0.0),
                        child: new IconButton(
                            iconSize: 20.0, 
                            padding: const EdgeInsets.all(0.0),
                            alignment: Alignment.center,
                            icon: Icon(
                              Icons.favorite,
                              color: Color(0XFFdbdbdb),
                            ),
                            onPressed: () {}),
                      ),
                    ],
                  ),
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          height: SizeConfig.safeBlockVertical * 4,
                          child: Text(
                            "$prodDesc",
                            overflow: TextOverflow.ellipsis,
                            style: new TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: SizeConfig.safeBlockVertical*1.5,
                                color: Color(0XFF5d5e62)),
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
/*                   Container(
                      width: double.infinity,
                      child: RaisedButton(
                        color: DataProvider().primary,
                        onPressed: () {},
                        child: const Text('ADD TO BAG',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ), */
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
