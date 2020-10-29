import 'package:castel_pos/data_models/order_list_item.dart';
import 'package:castel_pos/db_sqlite/init_db.dart';
import 'package:castel_pos/providers/menu_items_provider.dart';
import 'package:castel_pos/providers/order_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Must be stateful to call setState whenever needed
class PayButton extends StatefulWidget {
  State createState() => PayButtonState();
}

class PayButtonState extends State<PayButton> {
  
  final db = MenuOrderingDatabase.instance;
  

  @override
  Widget build(BuildContext context) {

    
    var orderDataProvider = Provider.of<OrderDataProvider>(context);
    var menuItemsProvider = Provider.of<MenuItemsProvider>(context);


    return InkWell(
        child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              child: FlatButton(
                
                onPressed: () async {
                  
                  if(orderDataProvider.orderList.length>0) {

                    double st = orderDataProvider.subTotal;
                    int d = orderDataProvider.discount;
                    double t = orderDataProvider.total;

                    Map<String, dynamic> orderSummary = {
                      'date_time' : DateTime.now().toString(),
                      'sub_total' : st,
                      'discount' : d,
                      'total' : t
                    };



                    db.saveOrderSummary(orderSummary).then((value) {
                      db.saveOrderDetails(orderListToMapList(orderDataProvider.orderList, value)).whenComplete(() {
                        orderDataProvider.resetValues();
                        menuItemsProvider.resetSelectedItemData();
                      });
                    });
                    

                  } else ; // do nothing

                },
                height: 40,
                color: orderDataProvider.orderList.length>0 ? Colors.green : Colors.grey,
                textColor: Colors.white,
                child: saveButtonText("SAVE ORDER"),
                shape: saveButtonShape(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  saveSummaryAndGetID (Map _orderSummary) {
    return db.saveOrderSummary(_orderSummary);
  }

  List<Map> orderListToMapList(List<OrderListItemData> _list, int id) {
    List<Map> returnValue = List();
    for(int x=0;x<_list.length;x++)
      returnValue.add(_list[x].toDatabaseReadyMap(id));
    return returnValue;
  }

  static Text saveButtonText(String _title) {
    return Text(
      _title,
      style: saveButtonTextStyle(),
    );
  }

  static TextStyle saveButtonTextStyle() {
    return TextStyle(
      fontSize: 15.0,
    );
  }

  static saveButtonShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    );
  }


}
