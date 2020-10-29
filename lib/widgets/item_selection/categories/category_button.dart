import 'package:castel_pos/data_models/item_category.dart';
import 'package:castel_pos/global_variables.dart';
import 'package:castel_pos/providers/menu_items_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final ItemCategory category;
  CategoryButton({@required this.text, @required this.icon, @required this.category});
  State createState() => CategoryButtonState();
}

class CategoryButtonState extends State<CategoryButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    
    var menuItemsProvider = Provider.of<MenuItemsProvider>(context);

    return Expanded(
      child: Container(
        child: FlatButton(
          onPressed: () {
            menuItemsProvider.setSelectedItemCategory = widget.category;
          },
          shape: flatButtonShape(),
          color: menuItemsProvider.selectedCategory==widget.category ? Colors.blue : GlobalVariables.bg,
          textColor: menuItemsProvider.selectedCategory==widget.category ? Colors.white : Colors.blue,
          padding: EdgeInsets.all(3.0),
          child: buttonContent(widget.text, widget.icon),
        ),
      ),
    );
  }

  buttonContent(String _text, IconData _icon) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(_icon, size: 25),
          Container(width: 7, height: 0,),
          Text(
            _text,
            style: buttonTextStyle()
          ),
        ],
      ),
    );
  }

  TextStyle buttonTextStyle() {
    return TextStyle(
      fontSize: 15.0,
    );
  }

  RoundedRectangleBorder flatButtonShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(color: Colors.blue)
    );
  }

}
