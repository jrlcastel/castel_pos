import 'package:castel_pos/global_variables.dart';
import 'package:flutter/material.dart';

class DrinksButton extends StatefulWidget {
  State createState() => DrinksButtonState();
}

class DrinksButtonState extends State<DrinksButton> {
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
            side: BorderSide(color: Colors.blue)
          ),
          color: GlobalVariables.bg,
          textColor: Colors.blue,
          padding: EdgeInsets.all(3.0),
          onPressed: () {},
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wine_bar),
                Container(width: 10, height: 0,),
                Text(
                  "Beverages",
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
