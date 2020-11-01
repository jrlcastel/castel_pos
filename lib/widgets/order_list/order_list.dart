import 'package:castel_pos/global_variables.dart';
import 'package:castel_pos/widgets/order_list/order_details/order_summary_details.dart';
import 'package:castel_pos/widgets/order_list/order_list_header_label.dart';
import 'package:castel_pos/widgets/order_list/order_list_items.dart';
import 'package:castel_pos/widgets/order_list/order_list_title.dart';
import 'package:castel_pos/widgets/order_options/save_orders_button.dart';
import 'package:flutter/material.dart';


// Order List
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
                  // title for order list
                  OrderListTitle(orderListTitle: "Order List"),
                  // label for order lsit columns
                  OrderListHeaderLabel(),
                  // order list items
                  OrderListItems(),
                  // order list calculations
                  OrderSummaryDetails(),
                  Container(height: 10),
                  // save order button
                  SaveOrderButton(),
                ],
              )
            ),
          ),
        ],
      ),
    );
                  
  }

}
