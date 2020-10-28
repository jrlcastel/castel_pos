import 'package:castel_pos/global_variables.dart';
import 'package:castel_pos/widgets/item_selection/app_options_bar.dart';
import 'package:castel_pos/widgets/item_selection/categories/categories.dart';
import 'package:castel_pos/widgets/item_selection/items.dart';
import 'package:flutter/material.dart';

class ItemSelection extends StatefulWidget {
  final int horizontalFlex;
  ItemSelection({@required this.horizontalFlex});
  State createState() => ItemSelectionState();
}

class ItemSelectionState extends State<ItemSelection> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.horizontalFlex,
      child: Container(
        padding: EdgeInsets.all(10),
        color: GlobalVariables.bg,
        child: Column(
          children: [
            AppOptionsBar(),
            Container(height: 10,),
            Items(),
            Container(height: 10,),
            Categories(),
          ],
        ),
      ),
    );
                  
  }

}
