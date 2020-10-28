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
      onPressed: () => cancelButtonOnPressedFunction(),
      child: buttonText("Cancel Order"),
      shape: buttonShape(),
      // height: 30,
      color: GlobalVariables.bg,
      textColor: Colors.red,
      padding: EdgeInsets.all(3.0),
    );
  }


  // Save button onPressed handler
  // Receives nothing, returns nothing
  static void cancelButtonOnPressedFunction() {
    
    // Debugging purposes
    // print("    DEBUG: Save Order Button Pressed");

    

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
