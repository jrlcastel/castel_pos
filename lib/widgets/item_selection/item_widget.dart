import 'package:castel_pos/data_models/item_category.dart';
import 'package:castel_pos/data_models/item_data.dart';
import 'package:castel_pos/providers/menu_items_provider.dart';
import 'package:castel_pos/providers/order_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      child: selected(widget.itemData) ? showAddToOrderListOptions() : showItemData(),
      );
  }

  selected(ItemData itemData) {
    var menuItemsProvider = Provider.of<MenuItemsProvider>(context);
    if(menuItemsProvider.selectedItemData!=null) {
      if(itemData.isTheSameAs(menuItemsProvider.selectedItemData)) return true;
    } return false;
  }




  showItemData() {

    var menuItemsProvider = Provider.of<MenuItemsProvider>(context);

    return InkWell(
      onTap: () {
        menuItemsProvider.setSelectedItemData = widget.itemData;
        // menuItemsProvider.setSelectedItemID = widget.itemData.id;
      },
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        itemName(widget.itemData.name),
        priceLabel(widget.itemData.price.toString()),
      ],
    ),
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


  showAddToOrderListOptions() {
    return Column(
      children: [
        cancelItemSelectionButton(),
        selectionCounterButtons(),  
        addItemSelectionButton(),
      ],
    );
  }

  selectionCounterButtons() {
    var menuItemsProvider = Provider.of<MenuItemsProvider>(context);
    return InkWell(
      onTap: () {

      },
        child: Container(
        height: 48,
        child: Row(
          children: [
            InkWell(
              onTap: () => menuItemsProvider.decreaseSelectedItemCount(),
              child: Icon(Icons.keyboard_arrow_left, size: 35,)),
            Expanded(child: Container(child: Center(child: Text(menuItemsProvider.selectedItemCount.toString()))),),
            InkWell(
              onTap: () => menuItemsProvider.increaseSelectedItemCount(),
              child: Icon(Icons.keyboard_arrow_right, size: 35)),
          ],
        ),
      ),
    );
  }

  cancelItemSelectionButton() {
    var menuItemsProvider = Provider.of<MenuItemsProvider>(context);
    return InkWell(
      onTap: () {
        menuItemsProvider.resetSelectedItemData();
      },
          child: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
              height: 30,
              child: Center(child: Text("Cancel")),
            ),
          )
        ],
      ),
    );
  }

  addItemSelectionButton() {

    var orderDataProvider = Provider.of<OrderDataProvider>(context);
    var menuItemsProvider = Provider.of<MenuItemsProvider>(context);

    return InkWell(
      onTap: () {
        orderDataProvider.addToOrderList(menuItemsProvider.selectedItemData, menuItemsProvider.selectedItemCount);
        menuItemsProvider.setSelectedItemData = ItemData(id: "", name: "", category: menuItemsProvider.selectedCategory, price: 0.0);
      },
          child: Row(
        children: [
          Expanded(
            child: Container(
              color:Colors.blue,
              height: 30,
              child: Center(child: Text("Add")),
            ),
          )
        ],
      ),
    );
  }



}






          
