import 'package:castel_pos/data_models/item_category.dart';
import 'package:flutter/material.dart';

class OrderDataSummary {

  String orderSummaryID;
  DateTime dateTime;
  double subTotal;
  int discount;
  double total;
  
  Map<String,dynamic> toDatabaseReadyMap() {
    return {
      'date_time' : DateTime.now().toString(),
      'sub_total' : subTotal,
      'discount' : discount,
      'total' : total,
    };
  }

}


class OrderDataDetail {

  String itemName;
  int quantity;
  double calculatedPrice;
  
  Map<String,dynamic> toDatabaseReadyMap() {
    return {
      'item_name' : itemName,
      'quantity' : quantity,
      'calculated_price' : calculatedPrice,
    };
  }


}