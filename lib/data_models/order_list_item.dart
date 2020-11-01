import 'package:castel_pos/data_models/item_data.dart';
import 'package:flutter/material.dart';

// used in order list
class OrderListItemData {

  // compact item data
  ItemData item;
  // number of items on the order list
  int qty;

  // calculates the total price
  double get totalPrice => item.price*qty;
  
  // converts this data to map for database query
  Map<String,dynamic> toDatabaseReadyMap(int _summaryID) {
    return {
      'summary_id' : _summaryID,
      'item_name' : item.name,
      'quantity' : qty,
      'calculated_price' : totalPrice,
    };
  }

  OrderListItemData({
    @required this.item,
    @required this.qty,
  });

}