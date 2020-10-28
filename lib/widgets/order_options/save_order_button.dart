import 'package:flutter/material.dart';

// Must be stateful to call setState whenever needed
class PayButton extends StatefulWidget {
  State createState() => PayButtonState();
}

class PayButtonState extends State<PayButton> {
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            child: FlatButton(
              onPressed: () => saveButtonOnPressedFunction(),
              height: 40,
              color: Colors.green,
              textColor: Colors.white,
              child: saveButtonText("SAVE ORDER"),
              shape: saveButtonShape(),
            ),
          ),
        ),
      ],
    );
  }

  // Save button onPressed handler
  // Receives nothing, returns nothing
  static void saveButtonOnPressedFunction() {
    
    // Debugging purposes
    // print("    DEBUG: Save Order Button Pressed");

    

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
