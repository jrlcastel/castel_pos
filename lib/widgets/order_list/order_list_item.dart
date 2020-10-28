import 'package:castel_pos/data_models/order_list_item.dart';
import 'package:castel_pos/global_variables.dart';
import 'package:flutter/material.dart';

class OrderListItem extends StatefulWidget {
  final OrderListItemData orderListItemData;
  OrderListItem({@required this.orderListItemData});
  State createState() => OrderListItemState();
}

class OrderListItemState extends State<OrderListItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:5, bottom: 5),
      decoration: BoxDecoration(
        color: GlobalVariables.bg,
        // border: Border(
        //   top: BorderSide(width: 1, color: Colors.grey),
        //   bottom: BorderSide(width: 1, color: Colors.grey),
        // )
      ),
      height: 25,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Expanded(
            flex: 5,
            child: Container(
              child: Center(
                child: Text(
                  widget.orderListItemData.item.name,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            )
          ),
          

          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: Text(widget.orderListItemData.qty.toString()),
              ),
            )
          ),

          Expanded(
            flex: 3,
            child: Container(
              child: Center(
                child: Text("P " + (widget.orderListItemData.qty*widget.orderListItemData.item.price).toString()),
              ),
            )
          ),


        ],
      ),
    );
  }

}
