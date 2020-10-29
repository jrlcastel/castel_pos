import 'dart:convert';
import 'package:flutter/services.dart';

  // table names
  String burgersTableName = "burgers";
  String beveragesTableName = "beverages";
  String comboMealsTableName = "combo_meals";
  String orderDetailsTableName = "order_details";
  String orderSummaryTableName = "order_summary";
  String discountTableName = "discounts";

  // premade data file location
  String burgerDataJsonFilePath = "assets/json/burgers.json";
  String beverageDataJsonFilePath = "assets/json/beverages.json";
  String comboMealDataJsonFilePath = "assets/json/combo_meals.json";
  String discountDataJsonFilePath = "assets/json/discounts.json";
  
  // generate automated table query
  String createBurgersTableQuery = generateCreateTableQuery(burgersTableName, burgersTableProperties);
  String createBeveragesTableQuery = generateCreateTableQuery(beveragesTableName, beveragesTableProperties);
  String createComboMealsTableQuery = generateCreateTableQuery(comboMealsTableName, comboMealsTableProperties);
  String createOrderDetailsTableQuery = generateCreateTableQuery(orderDetailsTableName, orderDetailsTableProperties);
  String createOrderSummaryTableQuery = generateCreateTableQuery(orderSummaryTableName, orderSummaryTableProperties);
  String createDiscountsTableQuery = generateCreateTableQuery(discountTableName, discountsTableProperties);

  // db table properties
  Map<String, String> burgersTableProperties = {
    'item_id' : "INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL",
    'item_name' : "TEXT",
    'price' : "REAL",
  };
  
  // db table properties
  Map<String, String> beveragesTableProperties = {
    'item_id' : "INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL",
    'item_name' : "TEXT",
    'price' : "REAL",

  };
  
  // db table properties
  Map<String, String> comboMealsTableProperties = {
    'item_id' : "INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL",
    'item_name' : "TEXT",
    'price' : "REAL",
  };
  
  // db table properties
  Map<String, String> orderDetailsTableProperties = {
    'order_detail_id' : "INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL",
    'summary_id' : "INTEGER",
    'item_name' : "TEXT",
    'quantity' : "INTEGER",
    'calculated_price' : "REAL",
  };
  
  // db table properties
  Map<String, String> orderSummaryTableProperties = {
    'order_summary_id' : "INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL",
    'date_time' : "TEXT",
    'sub_total' : "REAL",
    'discount' : "INTEGER",
    'total' : "REAL",
  };
  
  // db table properties
  Map<String, String> discountsTableProperties = {
    'discount_id' : "INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL",
    'discount_name' : "TEXT",
    'discount' : "INTEGER",
  };

  // db table properties
  String generateCreateTableQuery (String tableName, Map<String, String> columns) {
    String tableColumns = "";
    int colCount = columns.length;
    int loopCounter = 0;
    columns.forEach((k, v) {
      if (loopCounter<colCount-1) tableColumns += (k + " " + v + ", ");
      else tableColumns += (k + " " + v);
      loopCounter++;
    });
    String createTableQuery = "CREATE TABLE " + tableName + " (" + tableColumns + ")";
    return createTableQuery;
  }
