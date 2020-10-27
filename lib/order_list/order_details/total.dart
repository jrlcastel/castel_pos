import 'package:flutter/material.dart';

class Total extends StatefulWidget {
  State createState() => TotalState();
}

class TotalState extends State<Total> {
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
            // color: Colors.lightGreen,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              children: [
                totalText("Total"),
                Expanded(
                  child: Container(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: totalText("\$ 800.00"),
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  totalText(String _total) {
    return Text(
      _total,
      style: totalTextStyle(),
    );
  }

  TextStyle totalTextStyle() {
    return TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.bold,
    );
  }

}
