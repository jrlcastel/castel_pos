import 'package:flutter/material.dart';

class OrderListItems extends StatefulWidget {
  State createState() => OrderListItemsState();
}

class OrderListItemsState extends State<OrderListItems> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Container(
            color: Colors.indigo,
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 23r23r23"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 4gj42r23r23r90"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item werewrewrw"),
                          dummyOrderListItem("item 2r32r2r"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 23r32r"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 4gj3rv3v3490"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 23r23r"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 4gj23r32r32490"),
                          dummyOrderListItem("item 422r23r0"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 2r23r32"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 2r23r"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 23r23r32r"),
                          dummyOrderListItem("item 4gj490"),
                          dummyOrderListItem("item 4gj490"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  dummyOrderListItem(String _itemName) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 30,
            child: Center(
              child: Text(_itemName),
            ),
          ),
        )
      ],
    );
  }

}
