import 'package:castel_pos/global_variables.dart';
import 'package:castel_pos/item_selection/categories/burgers_button.dart';
import 'package:castel_pos/item_selection/categories/combo_meals_button.dart';
import 'package:castel_pos/item_selection/categories/drinks_button.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  State createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:40,
      child: Row(
        children: [
          Expanded(child:
          Container(
            // padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          color: GlobalVariables.bg,
            child: Row(
              children: [
                BurgersButton(),
                Container(width: 15,),
                DrinksButton(),
                Container(width: 15,),
                ComboMealsButton(),
              ],
            ),
          )
        )
        ],
      ),
    );
  }

}
