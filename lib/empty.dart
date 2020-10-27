import 'package:flutter/material.dart';

class YourClassName extends StatefulWidget {
  State createState() => YourClassNameState();
}

class YourClassNameState extends State<YourClassName> {
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
