import 'package:flutter/material.dart';

class PayButton extends StatefulWidget {
  State createState() => PayButtonState();
}

class PayButtonState extends State<PayButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              height: 40,
            // color: Colors.black,
            child: FlatButton(
              // padding: EdgeInsets.all(0),
              height: 40,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                // side: BorderSide(color: Colors.red)
              ),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {},
              child: Text(
                "PAY",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


}
