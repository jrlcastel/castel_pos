import 'package:castel_pos/providers/order_data_provider.dart';
import 'package:castel_pos/widgets/order_list/order_details/discount_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderDetail extends StatefulWidget {
  final String title;
  final String value;
  final bool valueWrapped;
  OrderDetail({@required this.title, @required this.value, @required this.valueWrapped});
  State createState() => OrderDetailState();
}

class OrderDetailState extends State<OrderDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    
    var orderDataProvider = Provider.of<OrderDataProvider>(context);

    return InkWell(
      onTap: () {
        showDiscountDialog(orderDataProvider);
      },
          child: Container(
        decoration: orderDetailsBoxDecoration(),
        padding: EdgeInsets.fromLTRB(10, widget.valueWrapped ? 0 : 5, 10, 5),
        child: Row(
          children: [
            orderDetailText(widget.title),
            Spacer(),
            widget.valueWrapped ? orderDetailWrappedValueText(widget.value) : orderDetailText(widget.value),
          ],
        ),
      ),
    );
  }

  showDiscountDialog(OrderDataProvider orderDataProvider) async {
    
    
    await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("Select Discount:"),
        actions: [
          FlatButton(onPressed: ()=> Navigator.pop(context), child: Text("Cancel")),
          FlatButton(onPressed: (){
            orderDataProvider.setDiscount = orderDataProvider.selectedDiscount;
            Navigator.pop(context);
          }, child: Text("Confirm")),
        ],
        content: DiscountDialog(),
      ));
  }

  Text orderDetailText(String _title) {
    return Text(
      _title,
      style: orderDetailsTextStyle(),
    );
  }

  Container orderDetailWrappedValueText(String _value) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(width:1, color: Colors.black),
        borderRadius: BorderRadius.circular(3)
      ),
      child: orderDetailText(_value)
    );
  }

  TextStyle orderDetailsTextStyle() {
    return TextStyle(
      fontSize: 16,
    );
  }

  BoxDecoration orderDetailsBoxDecoration() {
    return BoxDecoration(
      border: Border(
        left: BorderSide(width:1, color:Colors.grey),
        right: BorderSide(width:1, color:Colors.grey),
      )
    );
  }

}
