import 'package:castel_pos/data_models/order_data.dart';
import 'package:castel_pos/db_sqlite/init_db.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SavedOrdersScreen extends StatefulWidget {
  State createState() => SavedOrdersScreenState();
}

class SavedOrdersScreenState extends State<SavedOrdersScreen> {

  String selectedOrder = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar( title: Text("Scaffold Title"),),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                // height:
                child: Row(
                  children: [
                    orderSummaryPanel(),
                    orderDetailsPanel(),
                  ],
                ),
              );

            },
          ),
        )
    );
  }

  // clear , delete

  orderSummaryPanel() {
    return Expanded(
      flex: 3,
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                children: [
                  optionsBar(),
                  Container(height:10),
                  orderSummaryList(),
                ],
              ),
            ))
          ],
        ),
      ));
  }

            // savedOrdersTitle(),
  orderSummaryList() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(
            width:2,
            color: Colors.grey
          ),
        ),
        child: orderSummaryListFutureBuilder(),
      )
    );
  }

  savedOrdersTitle() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 30,
            color: Colors.grey,
            child: Center(
              child: Text(
                "Saved Orders"
              )
            ),
          ),
        ),
      ],
    );
  }

  
  fetchDatabaseItems(String tableName) async {
    MenuOrderingDatabase db = MenuOrderingDatabase.instance;
    return await db.getDatabaseTableItems(tableName);
  }

  // orderSummary list to widget list
  orderSummaryWidgetList(List<OrderDataSummary> _data) {
    List<Widget> returnValue = List();

    for(int x=0;x<_data.length;x++) {
      returnValue.add(orderSummaryWidget(_data[x]));
    }

    return returnValue;

  }

  orderSummaryWidget(OrderDataSummary _data) {
    return InkWell(
      onTap: () {
        selectedOrder = _data.orderSummaryID;
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.only(left:10, top:15, bottom: 15),
        decoration: BoxDecoration(
          color: selectedOrder == _data.orderSummaryID ? Colors.blue : Colors.white,
        ),
        child: Row(
          children: [
            InkWell(
              child: Icon(Icons.close, size: 20), 
              onTap: () {
                removeFromSummaryTable(_data.orderSummaryID);
                setState(() {});
              }),
            Container(width:10),
            Text("ID: " + _data.orderSummaryID),
            Container(width:10),
            Text("Date Added: " + getMonth(_data.dateTime.month) + " " + _data.dateTime.day.toString() +", " + _data.dateTime.year.toString()),
            Container(width:10),
            Text("Total: " + _data.total.toString()),
          ],
        ),
      ),
    );
  }

  String getMonth(int x) {
    switch(x) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return "";
      
    }
  }

  List<OrderDataSummary> snapshotToSummaryDataList(List queryResult) {
    List<OrderDataSummary> returnValue = List();

    for(int x=0;x<queryResult.length;x++)
      returnValue.add(toSummaryData(queryResult[x]));

    return returnValue;
  }

  OrderDataSummary toSummaryData (Map _data) {
    return OrderDataSummary(
      dateTime:  DateTime.parse(_data['date_time']) ,
      discount: _data['discount'],
      orderSummaryID: _data['order_summary_id'].toString(),
      subTotal: _data['sub_total'],
      total: _data['total'],
    );
  }


  orderSummaryListFutureBuilder() {
    return FutureBuilder(
        future: fetchDatabaseItems('order_summary'),
        builder: (context, snapshot) {
    if(snapshot.hasData) {
      print("has data");
      if(snapshot.connectionState==ConnectionState.waiting) {
        return Center(child: Text("Please wait..."));
      } else if(snapshot.connectionState==ConnectionState.done) {

        print("\n\nFUTURE RESULT LENGHT: ${snapshot.data.length}");

        return SingleChildScrollView(
          child: Container(
            child: Column(
            children: orderSummaryWidgetList(snapshotToSummaryDataList(snapshot.data)),
            ),
          ),
        );
        // return widgetList(snapshot.data);

      } else if (snapshot.connectionState==ConnectionState.none) {
        return Center(child: Text("NONE"),);
      } else if(snapshot.connectionState==ConnectionState.active) {
        return Center(child: Text("ACTIVE"),);
      }
    } else return Center(child:Text("NO DATA"));
        },
      
      );
  }

  optionsBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            // color: Colors.yellow,
            child: Row(
              children: [
                backButton(),
              ],
            ),
          ),
        )
      ],
    );
  }


  backButton() {
    return Expanded(
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.white,
        onPressed: (){
          Navigator.of(context).pop();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chevron_left),
            Container(width: 10,),
            Text("Back to Ordering Menu"),
          ],
        ),
      ),
    );
  }

  orderDetailsPanel() {
    return Expanded(
      flex: 4,
      child: Container(
        child: Column(
          children: [
            Expanded(child: Container(
              // color: Colors.pink,
              padding: EdgeInsets.all(10),
              child: orderDetailsList(),
            ))
          ],
        ),
      ));
  }

  orderDetailsList() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width:2, color: Colors.grey)
      ),
      child: orderDetailListFutureBuilder(),
    );
  }

  

  orderDetailWidget(OrderDataDetail _data) {
    return Container(
      padding: EdgeInsets.only(top:20),
      child: Row(
        children: [
          Text(_data.itemName + " x" + _data.quantity.toString() + ",   P " + _data.calculatedPrice.toString())
        ],
      ),
    );
  }


  // orderSummary list to widget list
  orderDetailWidgetList(List<OrderDataDetail> _data) {
    List<Widget> returnValue = List();

    for(int x=0;x<_data.length;x++) {
      returnValue.add(orderDetailWidget(_data[x]));
    }

    return returnValue;

  }


  OrderDataDetail toOrderDetail(Map _data) {
    return OrderDataDetail(
      calculatedPrice: _data['calculated_price'],
      itemName: _data['item_name'],
      quantity: _data['quantity'],
      summaryID: _data['summary_id'],
    );
  }


  List<OrderDataDetail> snapshotToDeatilList(List queryResult) {
    List<OrderDataDetail> returnValue = List();

    for(int x=0;x<queryResult.length;x++)
      returnValue.add(toOrderDetail(queryResult[x]));

    return returnValue;
  }





  // fetchDatabaseItems(String tableName) async {
  //   MenuOrderingDatabase db = MenuOrderingDatabase.instance;
  //   return await db.getDatabaseTableItems(tableName);
  // }

  fetchSummaryDetails(String tableName, String summaryID) async {
    MenuOrderingDatabase db = MenuOrderingDatabase.instance;
    return await db.getOrderDetails(tableName, summaryID);
  }

  removeFromSummaryTable (String id) async {
    MenuOrderingDatabase db = MenuOrderingDatabase.instance;
    return await db.removeFromSummaryTable(id);
  }

  orderDetailListFutureBuilder() {
    return FutureBuilder(
      future: fetchSummaryDetails('order_details', selectedOrder),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          print("has data");
          if(snapshot.connectionState==ConnectionState.waiting) {
            return Center(child: Text("Please wait..."));
          } else if(snapshot.connectionState==ConnectionState.done) {

            print("\n\nFUTURE RESULT LENGHT: ${snapshot.data.length}");
            if (snapshot.data.length==0) return Row(children: [Expanded(child: Container(child: Center(child: Text("Select Order"),),))],);
            else return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left:10),
                child: Column(
                  children: orderDetailWidgetList(snapshotToDeatilList(snapshot.data)),
                ),
              ),
            );
            // return widgetList(snapshot.data);

          } else if (snapshot.connectionState==ConnectionState.none) {
            return Center(child: Text("NONE"),);
          } else if(snapshot.connectionState==ConnectionState.active) {
            return Center(child: Text("ACTIVE"),);
          }
        } else return Center(child:Text("NO DATA"));
      },
    
    );
  }



}
