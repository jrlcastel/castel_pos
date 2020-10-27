import 'package:flutter/material.dart';

class SubTotal extends StatefulWidget {
  State createState() => SubTotalState();
}

class SubTotalState extends State<SubTotal> {
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
                Text("SubTotal: "),
                Expanded(
                  child: Container(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("\$ 1,000.00")
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
