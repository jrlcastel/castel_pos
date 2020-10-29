import 'dart:convert';
import 'package:castel_pos/db_sqlite/database_properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:sqflite/sqflite.dart';

class MenuOrderingDatabase {

  // database name on device path directory
  static const String DB_NAME = "ordering_menu.db";

  // private constructor
  MenuOrderingDatabase._privateConstructor();
  static final MenuOrderingDatabase instance = MenuOrderingDatabase._privateConstructor();
  
  Database _database;

  // getter method for the database
  Future<Database> get database async {

    // debug
    print("    DEBUG: database getter called");

    // if database exists, return the existing database instance
    // if not, create a new instance of the database
    return _database!=null ? _database : await createDatabase();
  }



  // Async function that handles opening od the database
  // creates a database if the database is does not exist
  Future<Database> createDatabase() async {
    String _path = await getDatabasesPath();
    String _dbPath = join(_path, DB_NAME);
    return await openDatabase(
      _dbPath,
      version: 1,
      onCreate: _onCreate
    );
  }

  // This function must be called when the database is created
  // Initializes the database content.
  Future _onCreate (Database db, int version) async {

    // Debug
    print("    DEBUG: Database onCreate function called.");

    // create database tables
    await db.execute(createBurgersTableQuery);
    await db.execute(createBeveragesTableQuery);
    await db.execute(createComboMealsTableQuery);
    await db.execute(createOrderDetailsTableQuery);
    await db.execute(createOrderSummaryTableQuery);
    await db.execute(createDiscountsTableQuery);
    
    // get data map list ( datatype - List<Map> ) from json files
    List burgersMapList = await getMapListFromJsonFile(burgerDataJsonFilePath, burgersTableProperties);
    List beveragesMapList = await getMapListFromJsonFile(beverageDataJsonFilePath, beveragesTableProperties);
    List comboMealsMapList = await getMapListFromJsonFile(comboMealDataJsonFilePath, comboMealsTableProperties);
    List discountsMapList = await getMapListFromJsonFile(discountDataJsonFilePath, discountsTableProperties);

    // uses existing JSON files, parse them, and insert to database table
    // populate burgers table from burger data JSON file
    for(int x=0; x<burgersMapList.length;x++) 
      await db.insert(burgersTableName, burgersMapList[x]);

    // uses existing JSON files, parse them, and insert to database table
    // populate burgers table from burger data JSON file
    for(int x=0; x<beveragesMapList.length;x++) 
      await db.insert(beveragesTableName, beveragesMapList[x]);

    // uses existing JSON files, parse them, and insert to database table
    // populate burgers table from burger data JSON file
    for(int x=0; x<comboMealsMapList.length;x++) 
      await db.insert(comboMealsTableName, comboMealsMapList[x]);
    

    // uses existing JSON files, parse them, and insert to database table
    // populate burgers table from burger data JSON file
    for(int x=0; x<discountsMapList.length;x++) 
      await db.insert(discountTableName, discountsMapList[x]);
    

  }

  // populate order details table
  Future saveOrderDetails(List<Map> _orderDetails) async {
    Database _db = await instance.database;
    for(int x=0; x<_orderDetails.length;x++) 
      await _db.insert(orderDetailsTableName, _orderDetails[x]);
  }

  // populate order summary
  Future saveOrderSummary(Map _orderSummary) async {
    Database _db = await instance.database;
    return await _db.insert(orderSummaryTableName, _orderSummary);
  }


  Future getDatabaseTableItems (String tableName) async {
    print("DEBUG: Database - Fetching $tableName data... ");
    Database _db = await instance.database;
    return await _db.query(tableName);
  }

  Future removeFromSummaryTable (String id) async {
    Database _db = await instance.database;
    return await _db.rawQuery("DELETE FROM \"order_summary\" WHERE \"order_summary_id\"=\"$id\"");
  }

  Future getOrderDetails (String tableName, String summaryID) async {
    print("DEBUG: Database - Fetching $tableName data... ");
    Database _db = await instance.database;
    return await _db.rawQuery("SELECT * FROM \"$tableName\" WHERE \"summary_id\"=\"$summaryID\"");
  }


  void printTable(String tableName) async {
    Database _db = await instance.database;
    List<Map> res = await _db.query(tableName);

    print("\n\nDATABASE TABLE NAME: $tableName");

    for(int x=0;x<res.length;x++)
        print("$x - " + res[x].toString());

    print("\n\n");

  }

  
  getMapListFromJsonFile(String filePath, Map properties) async {

    List<Map> _m = List();
    Map<String, dynamic> _n;

    final _jsonData = await rootBundle.loadString(filePath);
    var _jsonDecode = json.decode(_jsonData);

    for(var x in _jsonDecode) {
      _n = Map();
      properties.forEach((key, value) => _n[key] = x[key]);
      _m.add(_n);
    }
      
      return _m;

    }


  

}