import 'package:castel_pos/pos_screen.dart';
import 'package:castel_pos/providers/menu_items_provider.dart';
import 'package:castel_pos/providers/order_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuItemsProvider>(create: (context) => MenuItemsProvider()),
        ChangeNotifierProvider<OrderDataProvider>(create: (context) => OrderDataProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: POSScreen(),
      ),
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

  // Call this function to hide status bar.
  // Primary use case - get more screen real estate.
  // Uses the 'services' library.
  void hideStatusBar() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  
}