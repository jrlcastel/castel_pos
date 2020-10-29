import 'package:castel_pos/global_variables.dart';
import 'package:castel_pos/widgets/order_options/cancel_order_button.dart';
import 'package:castel_pos/widgets/order_options/saved_orders_button.dart';
import 'package:flutter/material.dart';

class AppOptionsBar extends StatefulWidget {
  State createState() => AppOptionsBarState();
}

class AppOptionsBarState extends State<AppOptionsBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 30,
            color: GlobalVariables.bg,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SavedOrdersButton(),
                Spacer(),
                CancelOrderButton(),
              ],
            ),
          )),
      ],
    );
  }

}
