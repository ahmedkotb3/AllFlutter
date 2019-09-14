import 'package:big/Screens/details.dart';
import 'package:big/Screens/whishlist.dart';
import 'package:big/Widgets/dataManager.dart';
import 'package:big/model/Productsmodel.dart';
import 'package:flutter/material.dart';
import 'package:big/Providers/DataProvider.dart';
import 'package:big/SizeConfig.dart';

class Products extends StatefulWidget {

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List productList = DataProvider.productList;

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
              allProuct: productList[index],
              prodId: productList[index]['id'],
              prodName: productList[index]['name'],
              prodPricture: productList[index]['picture'],
              prodOldPrice: productList[index]['old_price'],
              prodPrice: productList[index]['price'],
              prodFav: productList[index]['isfav'],
              //prodDesc: productList[index]['description'],
            ),
          );
        });
  }
}
class SingleProd extends StatefulWidget {
  final allProuct;
  final prodId;
  final prodName;
  final prodPricture;
  final prodOldPrice;
  final prodPrice;
  bool prodFav;
  //final prodDesc;

  SingleProd({
    this.allProuct,
    this.prodId,
    this.prodName,
    this.prodPricture,
    this.prodOldPrice,
    this.prodPrice,
    this.prodFav
    //this.prodDesc,
  });
  @override
  _SingleProdState createState() => _SingleProdState();
}

class _SingleProdState extends State<SingleProd> {
  bool isFav;
  Color favColor=Colors.grey;


  @override
  void initState() {
   if(widget.allProuct['isfav']==true){
     favColor=Colors.red;
   }
   else if(widget.allProuct['isfav']==false){
     favColor=Colors.grey;
   }
    super.initState();
  }
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
                            child: Text("New", textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white,),
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
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.prodPricture),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(product: widget.allProuct)));},
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
                              " ${widget.prodPrice} \EGY ",
                              style: new TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 3.5,
                                  color: Color(0XFF161a28)),
                            ),
                            new Text(
                              "${widget.prodOldPrice}\EGY",
                              style: TextStyle(
                                  color: Color(0XFF7f7f7f),
                                  fontWeight: FontWeight.w100,
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 2.5,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: SizeConfig.safeBlockVertical * 5.0,
                        padding: EdgeInsets.all(0.0),
                        child: new IconButton(
                            iconSize: 20.0,
                            padding: const EdgeInsets.all(0.0),
                            alignment: Alignment.center,
                            icon: Icon(
                              Icons.favorite,
                              color:favColor ,
                            ),
                            onPressed: ()async {
                              var db = new DatabaseManager();
                      int insert=await db.saveProduct(new Product(
                        'lcwkiki','njknjkjkjkjbjkbjkbjk','https://www.logaster.com/blog/wp-content/uploads/2013/06/jpg.png','EGY',500, 300,1, 1),
                      );
                      print("saved Product : $insert");
                         List  myUsers = await db.getAllUsers();
                              for(int i =0 ; i < myUsers.length;i++){
                                Product product = Product.map(myUsers[i]);
                                print('ID: ${product.title} - username: ${product.description} - city: ${product.isFavorite}');

                              }
                           }
                            ),
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
                            "${widget.prodName}",
                            overflow: TextOverflow.ellipsis,
                            style: new TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: SizeConfig.safeBlockVertical * 1.5,
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
