import 'package:castel_pos/data_models/item_data.dart';
import 'package:flutter/material.dart';

class OrderListItemData {

  ItemData item;
  int qty;

  double get totalPrice => item.price*qty;

  OrderListItemData({
    @required this.item,
    @required this.qty,
  });

}