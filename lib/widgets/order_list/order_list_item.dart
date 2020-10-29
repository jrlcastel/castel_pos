import 'package:castel_pos/data_models/order_list_item.dart';
import 'package:castel_pos/global_variables.dart';
import 'package:castel_pos/providers/order_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    
    var orderDataProvider = Provider.of<OrderDataProvider>(context);
    
    return InkWell(
        onTap: () {
          print("REMOVE: ${widget.orderListItemData.item.name}");
          showRemoveItemDialog(orderDataProvider);
        },
        child: Container(
        margin: EdgeInsets.only(top:3, bottom: 3),
        decoration: BoxDecoration(
          color: GlobalVariables.bg,
          // border: Border(
          //   top: BorderSide(width: 1, color: Colors.grey),
          //   bottom: BorderSide(width: 1, color: Colors.grey),
          // )
        ),
        height: 30,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Expanded(
              flex: 5,
              child: Container(
                child: Center(
                  child: Text(
                    widget.orderListItemData.item.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
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
      ),
    );
  }

  showRemoveItemDialog(OrderDataProvider orderDataProvider) async {
    
    
    await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Remove ${widget.orderListItemData.item.name}?"),
        actions: [
          FlatButton(onPressed: ()=> Navigator.pop(context), child: Text("CANCEL", style: TextStyle(color: Colors.grey),)),
          FlatButton(onPressed: (){

            orderDataProvider.removeFromOrderList(widget.orderListItemData.item);

            Navigator.pop(context);
          }, child: Text("REMOVE", style: TextStyle(color: Colors.red),)),
        ],
        // content: ,
      ));
  }

}
