import 'package:castel_pos/global_variables.dart';
import 'package:castel_pos/providers/order_data_provider.dart';
import 'package:castel_pos/widgets/order_list/order_details/order_detail.dart';
import 'package:castel_pos/widgets/order_list/order_details/total.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    
    var orderDataProvider = Provider.of<OrderDataProvider>(context);

    return Container(
      decoration: orderSummaryBoxDecoration(),
      child: Column(
        children: [
          OrderDetail(title: "Sub Total: ", value: "\P ${orderDataProvider.subTotal.toString()}", valueWrapped: false),
          OrderDetail(title: "Discount: ", value: (orderDataProvider.discount.toString() + "%"), valueWrapped: true),
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
