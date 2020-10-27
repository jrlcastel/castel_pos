import 'package:castel_pos/item_selection/item_selection.dart';
import 'package:castel_pos/order_list/order_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Local File Packages
import 'package:castel_pos/header.dart';

class POSScreen extends StatefulWidget {
  State createState() => POSScreenState();
}

class POSScreenState extends State<POSScreen> {


  @override
  void initState() {

    // switch to landscape mode
    lockLandscapeMode();

    // hides status bar
    hideStatusBar();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar( title: Text("Scaffold Title"),),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              
              // final double _screenHeight = constraints.maxHeight;
              // final double _screenWidth = constraints.maxWidth;

              return Row(
                children: [
                  
                  ItemSelection(
                    horizontalFlex: 8,
                    screenConstraints: constraints
                  ),

                  OrderList(
                    horizontalFlex: 5,
                    screenConstraints: constraints,
                  )

                ],
              );

            },
          ),
        )
    );
  }




  // This function toggles and locks landscape mode for Android Devices.
  // Uses the 'services' library.
  void lockLandscapeMode() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  void hideStatusBar() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

}
