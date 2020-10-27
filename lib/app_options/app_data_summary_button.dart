import 'package:flutter/material.dart';

class AppDataSummaryButton extends StatefulWidget {
  State createState() => AppDataSummaryButtonState();
}

class AppDataSummaryButtonState extends State<AppDataSummaryButton> {
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
        child: Icon(Icons.bar_chart_rounded),
      ),
    );
  }

}
