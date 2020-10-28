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
    return Container(
      decoration: totalBoxDecoration(),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        children: [
          totalText("Total"),
          Spacer(),
          totalText("\$ 800.00")
        ],
      ),
    );
  }

  static BoxDecoration totalBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width:1, color:Colors.grey),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(5),
        bottomRight: Radius.circular(5),
      )
    );
  }

  static Text totalText(String _total) {
    return Text(
      _total,
      style: totalTextStyle(),
    );
  }

  static TextStyle totalTextStyle() {
    return TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.bold,
    );
  }

}
