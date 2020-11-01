import 'package:castel_pos/db_sqlite/init_db.dart';
import 'package:castel_pos/global_variables.dart';
import 'package:castel_pos/providers/menu_items_provider.dart';
import 'package:castel_pos/providers/order_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CancelOrderButton extends StatefulWidget {
  State createState() => CancelOrderButtonState();
}

class CancelOrderButtonState extends State<CancelOrderButton> {

  final db = MenuOrderingDatabase.instance;

  @override
  void initState() {
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    
    var orderDataProvider = Provider.of<OrderDataProvider>(context);
    var menuItemsProvider = Provider.of<MenuItemsProvider>(context);

    return FlatButton(
      onPressed: () {
        
        // db.printTable('order_details');

        orderDataProvider.resetValues();
        menuItemsProvider.resetSelectedItemData();

      },
      child: buttonText("Cancel Order"),
      shape: buttonShape(),
      color: GlobalVariables.bg,
      textColor: Colors.red,
      padding: EdgeInsets.all(3.0),
    );
  }





  Text buttonText(String _buttonName) {
    return Text(
        _buttonName,
        style: TextStyle(
          fontSize: 15.0,
        ),
      );
  }
  
  RoundedRectangleBorder buttonShape() {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.red)
      );
  }

}
