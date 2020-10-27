import 'package:castel_pos/global_variables.dart';
import 'package:flutter/material.dart';

class OrderListHeaderLabel extends StatefulWidget {
  State createState() => OrderListHeaderLabelState();
}

class OrderListHeaderLabelState extends State<OrderListHeaderLabel> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: GlobalVariables.orderSummaryHeaderLabelColor,
        border: Border(
          top: BorderSide(width: 1, color: Colors.grey),
          bottom: BorderSide(width: 1, color: Colors.grey),
        )
      ),
      height: 25,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Expanded(
            flex: 5,
            child: Container(
              child: Center(
                child: Text("Item Name"),
              ),
            )
          ),
          

          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: Text("QTY"),
              ),
            )
          ),

          Expanded(
            flex: 3,
            child: Container(
              child: Center(
                child: Text("Price"),
              ),
            )
          ),


        ],
      ),
    );
  }

}
