import 'package:flutter/material.dart';

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
      "description":"Plus Button Back Guipure Lace Sleeve Belted Peplum Top"
    },
    {
      "name": "Red dress",
      "picture": "lib/assets/images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
      "description":"Plus Button Back Guipure Lace Sleeve Belted Peplum Top"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return SingleProd(
            prodName: productList[index]['name'],
            prodPricture: productList[index]['picture'],
            prodOldPrice: productList[index]['old_price'],
            prodPrice: productList[index]['price'],
            description:productList[index]['description'],
          );
        }
        );

  }
}

class SingleProd extends StatelessWidget {
  final prodName;
  final prodPricture;
  final prodOldPrice;
  final prodPrice;
  final description;
  SingleProd({
    this.prodName,
    this.prodPricture,
    this.prodOldPrice,
    this.prodPrice,
    this.description
  });
  @override
  Widget build(BuildContext context) {
    Color favoite=Colors.grey;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        child:GestureDetector(
          onTap: (){
          },
          child: Image.asset(
          prodPricture,
              fit:BoxFit.cover),
        ),
        footer: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridTileBar(
            backgroundColor:Colors.white30 ,
            leading: IconButton(
              icon: Icon(Icons.favorite),
              onPressed:(){
                
              },
              color:favoite,
            ),
            title: Text(prodName,
                textAlign: TextAlign.center),
            trailing:IconButton(icon: Icon(Icons.shopping_cart),
              color:favoite,
              onPressed: (){},
            ),
          ),
        ),
      ),
    );
  }
}
