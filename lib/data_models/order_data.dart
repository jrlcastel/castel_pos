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

  OrderDataSummary({@required this.orderSummaryID, @required this.dateTime, @required this.subTotal, @required this.discount, @required this.total, });

}


class OrderDataDetail {

  String itemName;
  int summaryID;
  int quantity;
  double calculatedPrice;
  
  Map<String,dynamic> toDatabaseReadyMap() {
    return {
      'item_name' : itemName,
      'quantity' : quantity,
      'calculated_price' : calculatedPrice,
    };
  }

  OrderDataDetail({@required this.itemName, @required this.summaryID, @required this.quantity, @required this.calculatedPrice});


}