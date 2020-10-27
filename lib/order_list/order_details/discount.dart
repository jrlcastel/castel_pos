import 'package:flutter/material.dart';

class Discount extends StatefulWidget {
  State createState() => DiscountState();
}

class DiscountState extends State<Discount> {
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
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              children: [
                Text("Discount: "),
                Expanded(
                  child: Container(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("20%")
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

}
