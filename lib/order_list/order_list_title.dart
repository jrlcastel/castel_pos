import 'package:castel_pos/global_variables.dart';
import 'package:flutter/material.dart';

class OrderListTitle extends StatefulWidget {
  final String orderListTitle;
  OrderListTitle({@required this.orderListTitle});
  State createState() => OrderListTitleState();
}

class OrderListTitleState extends State<OrderListTitle> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: GlobalVariables.orderSummaryTitleColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            height:30,
            child: Center(
              child: orderListTitleText(widget.orderListTitle),
            ),
          ),
        ),
      ],
    );
  }

  orderListTitleText(String _title) {
    return Text(
      _title,
      style: orderListTitleTextStyle(),
    );
  }

  orderListTitleTextStyle() {
    return TextStyle(
      fontSize: 17,
      color: Colors.black
    );
  }

}
