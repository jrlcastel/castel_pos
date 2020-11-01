import 'package:flutter/material.dart';

class Discount {

  // name of discount type
  String discountName;
  // discount from 1 to 100
  int discount;
  // discount identifier 
  int discountID;

  @override
  String toString() {
  return "Discount - $discountName : ${discount.toString()}";
  }

  Discount({@required this.discountName, @required this.discount, @required this.discountID});

}