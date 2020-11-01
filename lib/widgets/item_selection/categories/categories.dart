import 'package:castel_pos/data_models/item_category.dart';
import 'package:castel_pos/global_variables.dart';
import 'package:castel_pos/widgets/item_selection/categories/category_button.dart';
import 'package:flutter/material.dart';


// Group of category buttons
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
    color: GlobalVariables.bg,
      child: Row(
        children: [
          CategoryButton(text: "Burgers", icon: Icons.fastfood, category: ItemCategory.burger,),
          Container(width: 12,),
          CategoryButton(text: "Beverages", icon: Icons.wine_bar, category: ItemCategory.beverage),
          Container(width: 12,),
          CategoryButton(text: "Combo Meals", icon: Icons.restaurant_menu, category: ItemCategory.combo_meal),
        ],
      ),
    );
  }

}
