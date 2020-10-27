import 'package:castel_pos/global_variables.dart';
import 'package:flutter/material.dart';

class CancelOrderButton extends StatefulWidget {
  State createState() => CancelOrderButtonState();
}

class CancelOrderButtonState extends State<CancelOrderButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      height: 30,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.red)
      ),
      color: GlobalVariables.bg,
      textColor: Colors.red,
      padding: EdgeInsets.all(3.0),
      onPressed: () {},
      child: Text(
        "Cancel Order",
        style: TextStyle(
          fontSize: 15.0,
        ),
      ),
    );
  }


}
