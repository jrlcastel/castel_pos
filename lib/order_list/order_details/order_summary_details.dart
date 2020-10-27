import 'package:castel_pos/global_variables.dart';
import 'package:castel_pos/order_list/order_details/discount.dart';
import 'package:castel_pos/order_list/order_details/sub_total.dart';
import 'package:castel_pos/order_list/order_details/total.dart';
import 'package:flutter/material.dart';

class OrderSummaryDetails extends StatefulWidget {
  State createState() => OrderSummaryDetailsState();
}

class OrderSummaryDetailsState extends State<OrderSummaryDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: GlobalVariables.orderSummaryColor,
        // border: Border.all(width:1, color:Colors.red),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        )
      ),
      padding: EdgeInsets.only(top:5),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                SubTotal(),
                Discount(),
                horizontalSeparator(),
                Total(),
              ],
            ),
          )
        ],
      ),
    );
  }
  
  Widget horizontalSeparator () {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top:5),
            height: 1, 
            color: Colors.grey,
          )
        )
      ],
    );
  }

}
