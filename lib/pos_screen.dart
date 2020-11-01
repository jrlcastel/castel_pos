import 'package:castel_pos/widgets/item_selection/item_selection.dart';
import 'package:castel_pos/widgets/order_list/order_list.dart';
import 'package:flutter/material.dart';

class POSScreen extends StatefulWidget {
  State createState() => POSScreenState();
}

class POSScreenState extends State<POSScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar( title: Text("Scaffold Title"),),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Row(
                children: [
                  ItemSelection(horizontalFlex: 8),
                  OrderList(horizontalFlex: 5),
                ],
              );

            },
          ),
        )
    );
  }




}
