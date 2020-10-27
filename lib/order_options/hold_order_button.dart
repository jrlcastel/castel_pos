import 'package:castel_pos/global_variables.dart';
import 'package:flutter/material.dart';

class HoldOrderButton extends StatefulWidget {
  State createState() => HoldOrderButtonState();
}

class HoldOrderButtonState extends State<HoldOrderButton> {
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
        side: BorderSide(color: Colors.green)
      ),
      color: GlobalVariables.bg,
      textColor: Colors.green,
      padding: EdgeInsets.all(3.0),
      onPressed: () {},
      child: Text(
        "Hold Order",
        style: TextStyle(
          fontSize: 15.0,
        ),
      ),
    );
  }


}
