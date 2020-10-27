import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  State createState() => ItemWidgetState();
}

class ItemWidgetState extends State<ItemWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: itemWidgetDecoration(),
      height: 110,
      width: 120,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(child: Container(child: Text("[AA01] mccrispy chicken fillet ala king w/ rice & fries and drinks and drinks and drinks and drinks and drinks and drinks", overflow: TextOverflow.ellipsis, maxLines: 4, textAlign: TextAlign.center,))),
            ],
          ),
          Container(height: 15,),
          Text("P 9,999.99"),

          // Row(
          //   children: [
          //     Expanded(
          //       child: Container(
          //         height: 35,
          //         child: Row(
          //           children: [
          //             Icon(Icons.arrow_left,size: 25,),
          //             Text("0"),
          //             Icon(Icons.arrow_right),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // )

        ],
      )
    );
  }

  BoxDecoration itemWidgetDecoration() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 2, color: Colors.grey),
    );
  }

}
