import 'package:castel_pos/global_variables.dart';
import 'package:flutter/material.dart';

class BurgersButton extends StatefulWidget {
  State createState() => BurgersButtonState();
}

class BurgersButtonState extends State<BurgersButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Container(
        child: FlatButton(
          height: 30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.white)
          ),
          color: Colors.blue,
          textColor: Colors.white,
          padding: EdgeInsets.all(3.0),
          onPressed: () {},
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.fastfood, color: Colors.white,),
                Container(width: 10, height: 0,),
                Text(
                  "Burgers",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
