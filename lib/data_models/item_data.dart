import 'package:castel_pos/data_models/item_category.dart';
import 'package:flutter/material.dart';

class ItemData {

  // SQLite datatype - TEXT
  String name;
  
  // SQLite datatype - TEXT
  String id;

  // SQLite datatype - TEXT
  ItemCategory category;

  // SQLite datatype - REAL
  double price;

  ItemData({
    @required this.name,
    @required this.id,
    @required this.category,
    @required this.price,
  });

}