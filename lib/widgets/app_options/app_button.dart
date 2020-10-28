import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final Icon icon;
  final Function onPressed;
  AppButton({@required this.icon, @required this.onPressed});
  State createState() => AppButtonState();
}

class AppButtonState extends State<AppButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onPressed,
        child: Container(
        // height: 40,
        // width: 40,
        child: Center(
          child: widget.icon,
        ),
      ),
    );
  }

}
