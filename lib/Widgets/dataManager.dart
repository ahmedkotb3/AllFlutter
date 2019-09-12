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
  final String columnCurrency='currency';
  final String columnOffer='offer';
  final String columnIsNew='isNew';
  final String columnIsFavorite='isFavorite';

  Future<Database> get db async{
    if(_db != null){
      return _db;
    }
    _db = await intDB();
    return _db;
  }
  intDB() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path , 'mydb.db');
    var myOwnDB = await openDatabase(path,version: 100,
        onCreate: _onCreate);
    return myOwnDB;
  }
  void _onCreate(Database db , int newVersion) async{
    var sql = "CREATE TABLE $productTable ($columnId INTEGER PRIMARY KEY,"
        " $columnTitle TEXT, $columnDescription TEXT,  $columnImageUrl TEXT,"
        " $columnCurrency TEXT,$columnPrice INTEGER, $columnOffer INTEGER,  $columnIsNew INTEGER,$columnIsFavorite INTEGER )";
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
  void clearAllUsers() async{
    var dbClient = await  db;
    await dbClient.delete(productTable);
  }
}