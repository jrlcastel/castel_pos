import 'package:castel_pos/data_models/item_data.dart';
import 'package:castel_pos/widgets/order_list/order_list_item.dart';
import 'package:flutter/material.dart';

class OrderListItems extends StatefulWidget {
  State createState() => OrderListItemsState();
}

class OrderListItemsState extends State<OrderListItems> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(width:1, color:Colors.grey),
                right: BorderSide(width:1, color:Colors.grey),
              )
            ),
            // color: Colors.indigo,
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  orderListItems(ItemData _item, int qty) {
    
  }

}
