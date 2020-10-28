import 'package:castel_pos/global_variables.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool selected;
  CategoryButton({@required this.text, @required this.icon, @required this.selected});
  State createState() => CategoryButtonState();
}

class CategoryButtonState extends State<CategoryButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: FlatButton(
          onPressed: () {},
          shape: flatButtonShape(),
          color: widget.selected ? Colors.blue : GlobalVariables.bg,
          textColor: widget.selected ? Colors.white : Colors.blue,
          padding: EdgeInsets.all(3.0),
          child: buttonContent(widget.text, widget.icon),
        ),
      ),
    );
  }

  buttonContent(String _text, IconData _icon) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(_icon),
          Container(width: 10, height: 0,),
          Text(
            _text,
            style: buttonTextStyle()
          ),
        ],
      ),
    );
  }

  TextStyle buttonTextStyle() {
    return TextStyle(
      fontSize: 15.0,
    );
  }

  RoundedRectangleBorder flatButtonShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(color: Colors.blue)
    );
  }

}
