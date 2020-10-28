import 'package:castel_pos/global_variables.dart';
import 'package:flutter/material.dart';

class OrderListHeaderLabel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: orderListHeaderDecoration(),
      child: Row(
        children: [
          headerLabel("Item Name", 5),
          headerLabel("QTY", 2),
          headerLabel("Price", 3),
        ],
      ),
    );
  }


  BoxDecoration orderListHeaderDecoration() {
    return BoxDecoration(
      color: GlobalVariables.orderSummaryHeaderLabelColor,
      border: orderListHeaderBorderStyle(),
    );
  }

  Border orderListHeaderBorderStyle() {
    return Border(
      left: BorderSide(width: 1, color: Colors.grey),
      right: BorderSide(width: 1, color: Colors.grey),
    );
  }

  Widget headerLabel(String _labelName, int _flex) {
    return Expanded(
      flex: _flex,
      child: Container(
        height: 25,
        child: Center(
          child: Text(_labelName),
        ),
      )
    );
  }

}
