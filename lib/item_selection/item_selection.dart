import 'package:castel_pos/app_options/app_data_summary_button.dart';
import 'package:castel_pos/app_options/app_settings_button.dart';
import 'package:castel_pos/global_variables.dart';
import 'package:castel_pos/item_selection/categories/categories.dart';
import 'package:castel_pos/item_selection/items.dart';
import 'package:castel_pos/order_options/cancel_order_button.dart';
import 'package:castel_pos/order_options/hold_order_button.dart';
import 'package:flutter/material.dart';

class ItemSelection extends StatefulWidget {
  final int horizontalFlex;
  final BoxConstraints screenConstraints;
  ItemSelection({@required this.horizontalFlex, @required this.screenConstraints });
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
          color: GlobalVariables.bg, //Color.fromRGBO(210, 230, 250, 1.0),
        // height: widget.screenConstraints.maxHeight,
        child: Column(
          children: [
            
            Row(
              children: [
                Expanded(child: Container(
                  color: GlobalVariables.bg,
                  height: 40,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                      AppSettingsButton(),
                      AppDataSummaryButton(),

                      Spacer(),

                      HoldOrderButton(),
                      Container(width: 10,),
                      CancelOrderButton(),
                    ],
                  ),
                  )),
              ],
            ),

            Container(height: 10,),

            Items(),

            // separator
            Container(height: 10,),

            Categories(),
          ],
        ),
      ),
    );
                  
  }

}
