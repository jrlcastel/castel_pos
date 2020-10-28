import 'package:castel_pos/data_models/item_category.dart';
import 'package:castel_pos/data_models/item_data.dart';
import 'package:castel_pos/global_variables.dart';
import 'package:castel_pos/widgets/item_selection/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Items extends StatefulWidget {
  State createState() => ItemsState();
}

class ItemsState extends State<Items> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: itemsBoxDecoration(),
              padding: EdgeInsets.all(5),
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        direction: Axis.horizontal,
                        runSpacing: 10,
                        spacing: 10,
                        children: dummyItemList(25),
                      ),
                    ],
                  ),
                ),
              )
            )
          )
        ],
      )
    );
  }

  BoxDecoration itemsBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      border: Border.all(width:1, color: Colors.grey),
      color: Color.fromRGBO(210, 210, 210, 1.0),
    );
  }

  List<Widget> dummyItemList (int _count) {
    List<Widget> returnValue = List();
    ItemData _dummy = ItemData(
      name: "mccrispy chicken fillet ala king w/ rice & fries and drinks and drinks and drinks and drinks and drinks and drinks",
      id: "000000",
      category: ItemCategory.combo_meal,
      price: 9999.99,
    );
    for (int x=0;x<_count;x++) {
      returnValue.add(ItemWidget(itemData: _dummy,));
    }
    return returnValue;
  }

}
