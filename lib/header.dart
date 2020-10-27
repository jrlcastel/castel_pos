import 'package:flutter/material.dart';

class HeaderBar extends StatefulWidget {
  final double height;
  final double width;
  HeaderBar({@required this.width, @required this.height});
  State createState() => HeaderBarState();
}

class HeaderBarState extends State<HeaderBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: NavDrawer(),
        appBar: AppBar(
          title: Text("Scaffold Title"),
        ), //addTaskAppBar(),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Center(
                  child: Text("LOL")
                )
              );
            },
          ),
        )
    );
  }

}
