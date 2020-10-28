import 'package:castel_pos/global_variables.dart';
import 'package:flutter/material.dart';

class OrderListTitle extends StatelessWidget{

  final String orderListTitle;
  OrderListTitle({@required this.orderListTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height:30,
            decoration: orderListTitleDecoration(),
            child: orderListTitleText(this.orderListTitle),
          ),
        ),
      ],
    );
  }

  orderListTitleText(String _title) {
    return Center(
      child: Text(
        _title,
        style: orderListTitleTextStyle(),
      ),
    );
  }

  orderListTitleTextStyle() {
    return TextStyle(
      fontSize: 17,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }

  BoxDecoration orderListTitleDecoration() {
    return BoxDecoration(
      color: GlobalVariables.orderSummaryTitleColor,
      border: Border.all(width:1, color:Colors.grey),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
      ),
    );
  }

}
