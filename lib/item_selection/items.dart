import 'package:castel_pos/item_selection/item_widget.dart';
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
              color: Colors.grey,
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
                        children: [
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                          ItemWidget(),
                        ],
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

}
