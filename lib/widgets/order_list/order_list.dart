import 'package:castel_pos/global_variables.dart';
import 'package:castel_pos/widgets/order_list/order_details/order_summary_details.dart';
import 'package:castel_pos/widgets/order_list/order_list_header_label.dart';
import 'package:castel_pos/widgets/order_list/order_list_items.dart';
import 'package:castel_pos/widgets/order_list/order_list_title.dart';
import 'package:castel_pos/widgets/order_options/save_order_button.dart';
import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  final int horizontalFlex;
  OrderList({@required this.horizontalFlex});
  State createState() => OrderListState();
}


class OrderListState extends State<OrderList> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.horizontalFlex,
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              color: GlobalVariables.bg,
              child: Column(
                children: [
                  OrderListTitle(orderListTitle: "Order List"),
                  OrderListHeaderLabel(),
                  OrderListItems(),
                  OrderSummaryDetails(),
                  Container(height: 10),
                  PayButton(),
                ],
              )
            ),
          ),
        ],
      ),
    );
                  
  }

}
