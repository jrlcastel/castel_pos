import 'package:castel_pos/data_models/item_data.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  final ItemData itemData;
  ItemWidget({@required this.itemData});
  State createState() => ItemWidgetState();
}

class ItemWidgetState extends State<ItemWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: itemWidgetDecoration(),
      height: 110,
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          itemName(widget.itemData.name),
          priceLabel(widget.itemData.price.toString()),
        ],
      )
    );
  }

  Widget itemName(String _itemName) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: Text(
              _itemName,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              textAlign: TextAlign.center,
            )
          ),
        ],
      ),
    );
  }

  Widget priceLabel(String _price) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: priceLabelBoxDecoration(),
            padding: EdgeInsets.all(5),
            child: Center(
              child: Text(_price)
            )
          )
        ),
      ],
    );
  }

  BoxDecoration priceLabelBoxDecoration() {
    return BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(5),
        bottomRight: Radius.circular(5),
      )
    );
  }

  BoxDecoration itemWidgetDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      border: Border.all(width: 1, color: Colors.black),
    );
  }

}






          // Row(
          //   children: [
          //     Expanded(
          //       child: Container(
          //         color: Colors.red,
          //         height: 35,
          //         child: Center(child: Text("Cancel")),
          //       ),
          //     )
          //   ],
          // ),

          // Container(
          //   height: 40,
          //   child: Row(
          //     children: [
          //       Icon(Icons.keyboard_arrow_left, size: 40,),
          //       Expanded(child: Container(child: Center(child: Text("1"))),),
          //       Icon(Icons.keyboard_arrow_right, size: 40),
          //     ],
          //   ),
          // ),

          // Row(
          //   children: [
          //     Expanded(
          //       child: Container(
          //         color:Colors.blue,
          //         height: 35,
          //         child: Center(child: Text("Add")),
          //       ),
          //     )
          //   ],
          // ),
