import 'package:castel_pos/data_models/item_data.dart';
import 'package:flutter/material.dart';

class OrderListItemData {

  ItemData item;
  int qty;

  double get totalPrice => item.price*qty;
  
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