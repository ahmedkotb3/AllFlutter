import 'dart:io';
import 'dart:async';
import 'package:big/model/Productsmodel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
class DatabaseManager{
  static Database _db;
  final String productTable='ProductTable';
  final String columnId='id';
  final String columnTitle='title';
  final String columnDescription='description';
  final String columnImageUrl='ImageUrl';
  final String columnPrice='price';
  final String columnOffer='offer';
  final String columnIsNew='isNew';
  final String columnProductID='productID';

  Future<Database> get db async{
    if(_db != null){
      return _db;
    }
    _db = await intDB();
    return _db;
  }
  intDB() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path , 'mydb3.db');
    var myOwnDB = await openDatabase(path,version: 3,
        onCreate: _onCreate);
    return myOwnDB;
  }
  void _onCreate(Database db , int newVersion) async{
    var sql = "CREATE TABLE $productTable ($columnId INTEGER PRIMARY KEY,"
        " $columnTitle TEXT, $columnDescription TEXT,  $columnImageUrl TEXT,"
        " $columnPrice TEXT, $columnOffer TEXT,  $columnIsNew INTEGER,$columnProductID INTEGER )";
    await db.execute(sql);
  }
  Future<int> saveProduct( Product product) async{
    var dbClient = await  db;
    int result = await dbClient.insert("$productTable", product.toMap());
    return result;
  }
  Future<List> getAllUsers() async{
    var dbClient = await  db;
    var sql = "SELECT * FROM $productTable";
    List result = await dbClient.rawQuery(sql);
    return result.toList();
  }
  //get custom product by id
  Future<Product> getCustomProduct(int id) async{
    var dbClient = await  db;
    var sql = "SELECT * FROM $productTable WHERE $columnProductID = $id";
    var result = await dbClient.rawQuery(sql);
    if(result.length == 0) return null;
    return  new Product.fromMap(result.first) ;
  }
  Future<int> getCount() async{
    var dbClient = await  db;
    var sql = "SELECT COUNT(*) FROM $productTable";

    return  Sqflite.firstIntValue(await dbClient.rawQuery(sql)) ;
  }
  Future<int> deleteProduct(int id) async{
    var dbClient = await  db;
    return  await dbClient.delete(
        productTable , where: "$columnProductID = ?" , whereArgs: [id]
    );
  }
  void clearAllProduct() async{
    var dbClient = await  db;
    await dbClient.delete(productTable);
  }
}