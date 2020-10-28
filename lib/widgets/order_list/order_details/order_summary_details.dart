import 'package:castel_pos/global_variables.dart';
import 'package:castel_pos/widgets/order_list/order_details/order_detail.dart';
import 'package:castel_pos/widgets/order_list/order_details/total.dart';
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
      decoration: orderSummaryBoxDecoration(),
      child: Column(
        children: [
          OrderDetail(title: "Sub Total: ", value: "\$ 1,000", valueWrapped: false),
          OrderDetail(title: "Discount: ", value: "20%", valueWrapped: true),
          Total(),
        ],
      ),
    );
  }

  static BoxDecoration orderSummaryBoxDecoration() {
    return BoxDecoration(
      color: GlobalVariables.orderSummaryColor,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(5),
        bottomRight: Radius.circular(5),
      )
    );
  }

}
