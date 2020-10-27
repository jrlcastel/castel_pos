import 'package:castel_pos/global_variables.dart';
import 'package:flutter/material.dart';

class ComboMealsButton extends StatefulWidget {
  State createState() => ComboMealsButtonState();
}

class ComboMealsButtonState extends State<ComboMealsButton> {
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
                Icon(Icons.restaurant_menu),
                Container(width: 10, height: 0,),
                Text(
                  "Combo Meals",
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
