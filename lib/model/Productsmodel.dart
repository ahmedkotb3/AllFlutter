import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
 class Product with ChangeNotifier{
   String title;
   String description;
   String imageUrl;
   String currency;
   int price;
   int offer;
   int isNew;
  int isFavorite;
  int id;
  Product(
    this.title,
    this.description,
    this.imageUrl,
    this.currency,
    this.price,
    this.offer,
    this.isNew,
    this.isFavorite,
  );

  Product.map(dynamic obj){
    this.title=obj['title'];
    this.description=obj['description'];
    this.imageUrl=obj['imageUrl'];
    this.currency=obj['currency'];
    this.price=obj['price'];
    this.offer=obj['offer'];
    this.isNew=obj['isNew'];
    this.isFavorite=obj['isFavorite'];
    this.id=obj['id'];
  }

 String get _getTitle => title;
 String get _getDescription => description;
 String get _getImage=>imageUrl;
 String get _getCurrent => currency;
 int get _getPrice => price;
 int get _getOffer=>offer;
 int get _getIsNew=>isNew;
 int get _getISFavorite=>isFavorite;
 int get _getId => id;

 Map<String,dynamic>toMap(){
  var map =new Map<String,dynamic>();
  map['title']=_getTitle;
  map['description']=_getDescription;
  map['imageUrl']=_getImage;
  map['currency']=_getCurrent;
  map['price']=_getPrice;
  map['offer']=_getOffer;
  map['isNew']=_getIsNew;
  map['isFavorite']=_getISFavorite;
      if(id !=null){map['id']=_getId;}
  return map;
   }

    Product.fromMap(Map<String, dynamic> map) {
       this.title= map['title'];
       this.description= map['description'];
       this.imageUrl= map['imageUrl'];
       this.currency= map['currency'];
       this.price= map['price'];
        this.offer= map['offer'];
       this.isNew= map['IsNew'];
       this.isFavorite= map['isFavorite'];
       this.id= map['id'];
   }
   notifyListeners();
}