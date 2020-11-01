import 'package:castel_pos/data_models/discount.dart';
import 'package:castel_pos/db_sqlite/init_db.dart';
import 'package:castel_pos/providers/order_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscountDialog extends StatefulWidget {
  State createState() => DiscountDialogState();
}

class DiscountDialogState extends State<DiscountDialog> {

  String groupValue;
  int discount;

  @override
  void initState() {
    groupValue = 'default';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getDiscountListWidget(),
        ],
      ),
    );
  }

  getDiscountListWidget() {
    
    var orderDataProvider = Provider.of<OrderDataProvider>(context);
    
    if(orderDataProvider.discountListLoaded) return discountListDialogContent(orderDataProvider.discountList);
    else return discountListFutureBuilder();

  }

  FutureBuilder discountListFutureBuilder() {

    
    var orderDataProvider = Provider.of<OrderDataProvider>(context);

    return FutureBuilder(
      future: getDatabaseDiscountList(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          print("has data");
          if(snapshot.connectionState==ConnectionState.waiting) {
            return Center(child: Text("Please wait..."));
          } else if(snapshot.connectionState==ConnectionState.done) {


            orderDataProvider.setDiscountList(snapshot.data, false);
            orderDataProvider.setDiscountListLoaded = true;

            return discountListDialogContent(snapshot.data);

          } else if (snapshot.connectionState==ConnectionState.none) {
            return Center(child: Text("NONE"),);
          } else if(snapshot.connectionState==ConnectionState.active) {
            return Center(child: Text("ACTIVE"),);
          }
        } return Center(child:Text("NO DATA"));
      },
    );
  }

  List<Widget> discountItemWidgetList(List<Discount> _discountList) {
    List<Widget> returnValue = List();
    for(int x=0;x<_discountList.length;x++)
      returnValue.add(discountListItem(_discountList[x]));

    if(returnValue.length==0) return [Container()];
    else return returnValue;
    
  }

  Widget discountListItem(Discount _discountData) {
      
    var orderDataProvider = Provider.of<OrderDataProvider>(context);

    return Row(
      children: [
        Radio(
          value: _discountData.discountID.toString(),
          groupValue: groupValue,
          onChanged: (_value) {
            groupValue = _value;
            orderDataProvider.setSelectedDiscount  = _discountData.discount;
            setState(() {
            });
          }
        ),
        Text(_discountData.discountName + "  -  "),
        Text(_discountData.discount.toString() + "%"),
        
      ],
    );
  }

  Widget discountListDialogContent(List<Discount> _discountList) {
    return Container(
      child: Column(
        children: discountItemWidgetList(_discountList),
      ),
    );
  }


  
  Future<List<Discount>> getDatabaseDiscountList() async {
    
    print("DEBUG: Getting discounts data list");

    List<Discount> returnValue = List();
    var dataList =  await ferchDatabaseTableItems('discounts');

    
    for(int x=0;x<dataList.length;x++) {
      Discount dummy = Discount(
        discountName: dataList[x]['discount_name'],
        discount: dataList[x]['discount'],
        discountID: dataList[x]['discount_id']
      );
      returnValue.add(dummy);
    }

    return returnValue;
  }

  

  ferchDatabaseTableItems(String tableName) async {
    MenuOrderingDatabase db = MenuOrderingDatabase.instance;
    return await db.getDatabaseTableItems(tableName);
  }

}
