import 'package:castel_pos/data_models/order_list_item.dart';
import 'package:castel_pos/providers/order_data_provider.dart';
import 'package:castel_pos/widgets/order_list/order_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    
    var orderDataProvider = Provider.of<OrderDataProvider>(context);

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
                        children: orderListItems(orderDataProvider.orderList),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  List<Widget> orderListItems(List<OrderListItemData> _orderListItems) {
    
    List<Widget> _returnValue = List();
    
    for(int x=0;x<_orderListItems.length;x++)
     _returnValue.add(OrderListItem(orderListItemData:_orderListItems[x]));

    if(_returnValue.length==0) return [Container()];
    else return _returnValue;
    
  }

}
