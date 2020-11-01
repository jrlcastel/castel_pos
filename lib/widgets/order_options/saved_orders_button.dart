import 'package:castel_pos/db_sqlite/init_db.dart';
import 'package:castel_pos/global_variables.dart';
import 'package:castel_pos/widgets/saved_orders_screen/saved_orders_screen.dart';
import 'package:flutter/material.dart';

class SavedOrdersButton extends StatefulWidget {
  State createState() => SavedOrdersButtonState();
}

class SavedOrdersButtonState extends State<SavedOrdersButton> {

  final db = MenuOrderingDatabase.instance;

  @override
  void initState() {
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {

    return FlatButton(
      onPressed: () {
        
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SavedOrdersScreen()));

      },
      child: buttonText("Show Saved Orders"),
      shape: buttonShape(),
      color: GlobalVariables.bg,
      textColor: Colors.green,
      padding: EdgeInsets.all(3.0),
    );
  }


  Text buttonText(String _buttonName) {
    return Text(
        "  " + _buttonName + "  ",
        style: TextStyle(
          fontSize: 15.0,
        ),
      );
  }
  
  RoundedRectangleBorder buttonShape() {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.green)
      );
  }

}
