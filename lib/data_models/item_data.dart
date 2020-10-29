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

  // ItemData fromDatabase() {

  // }


  bool isTheSameAs(ItemData _newValue) {
    if(this.category!=_newValue.category) return false;
    else if(this.id!=_newValue.id) return false;
    else if(this.name!=_newValue.name) return false;
    else if(this.price!=_newValue.price) return false;
    else return true;
  }

  @override
  String toString() {
  return "ITEM DATA - Name: ${this.name}, Price: ${this.price.toString()}, ";
   }

  ItemData({
    @required this.name,
    @required this.id,
    @required this.category,
    @required this.price,
  });

}