import 'package:flutter/material.dart';

class AppSettingsButton extends StatefulWidget {
  State createState() => AppSettingsButtonState();
}

class AppSettingsButtonState extends State<AppSettingsButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      child: Center(
        child: Icon(Icons.settings),
      ),
    );
  }

}
