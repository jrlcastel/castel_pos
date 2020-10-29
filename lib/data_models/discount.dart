import 'package:castel_pos/data_models/item_category.dart';
import 'package:flutter/material.dart';

class Discount {

  String discountName;
  int discount;
  int discountID;

  @override
  String toString() {
  return "Discount - $discountName : ${discount.toString()}";
  }

  Discount({@required this.discountName, @required this.discount, @required this.discountID});

}