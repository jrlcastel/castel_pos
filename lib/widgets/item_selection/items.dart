import 'package:castel_pos/data_models/item_category.dart';
import 'package:castel_pos/data_models/item_data.dart';
import 'package:castel_pos/db_sqlite/init_db.dart';
import 'package:castel_pos/global_variables.dart';
import 'package:castel_pos/providers/menu_items_provider.dart';
import 'package:castel_pos/widgets/item_selection/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class Items extends StatefulWidget {
  State createState() => ItemsState();
}

class ItemsState extends State<Items> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    
    var menuItemsProvider = Provider.of<MenuItemsProvider>(context);

    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: itemsBoxDecoration(),
              padding: EdgeInsets.all(5),
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: getItemListWidget(),
                ),
              )
            )
          )
        ],
      )
    );
  }


  // determines whether to load widget from provider or from future builder
  getItemListWidget() {
    
    var menuItemsProvider = Provider.of<MenuItemsProvider>(context);

    if(menuItemsProvider.burgerItemListLoaded && menuItemsProvider.selectedCategory==ItemCategory.burger) {
      print("DEBUG: Cached");
      return widgetList(menuItemsProvider.burgerItemList);
    }
    else if(menuItemsProvider.beverageItemListLoaded && menuItemsProvider.selectedCategory==ItemCategory.beverage) {
      print("DEBUG: Cached");
      return widgetList(menuItemsProvider.beverageItemList);
    }
    else if(menuItemsProvider.comboMealItemListLoaded && menuItemsProvider.selectedCategory==ItemCategory.combo_meal) {
      print("DEBUG: Cached");
      return widgetList(menuItemsProvider.comboMealItemList);
    }
    else return itemListFutureBuilder();

  }


  itemListFutureBuilder () {
    return FutureBuilder(
      future: getItemList(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          print("has data");
          if(snapshot.connectionState==ConnectionState.waiting) {
            return Center(child: Text("Please wait..."));
          } else if(snapshot.connectionState==ConnectionState.done) {

            print("\n\nFUTURE RESULT LENGHT: ${snapshot.data.length}");

            return widgetList(snapshot.data);

          } else if (snapshot.connectionState==ConnectionState.none) {
            return Center(child: Text("NONE"),);
          } else if(snapshot.connectionState==ConnectionState.active) {
            return Center(child: Text("ACTIVE"),);
          }
        } else return Center(child:Text("NO DATA"));
      },

        
    
    );
  }





  Future<List<ItemData>> getItemList() async {

    print(" DEBUG: Item list Future builder called");

    var menuItemsProvider = Provider.of<MenuItemsProvider>(context);

    if(menuItemsProvider.selectedCategory==ItemCategory.burger) {
        print("DEBUG: BURGER List NOT loaded, calling database...");
        menuItemsProvider.setBurgerItemList = await getSelectedItemDataList("burgers", ItemCategory.burger);
        menuItemsProvider.setBurgerItemListLoaded();
        return menuItemsProvider.burgerItemList;
    }
    else if(menuItemsProvider.selectedCategory==ItemCategory.beverage) {
        print("DEBUG: BEVERAGE List loaded, returning saved data...");
        menuItemsProvider.setBeverageItemList = await getSelectedItemDataList("beverages", ItemCategory.beverage);
        menuItemsProvider.setBeverageItemListLoaded();
        return menuItemsProvider.beverageItemList;
    }
    else if(menuItemsProvider.selectedCategory==ItemCategory.combo_meal) {
        print("DEBUG: COMBO MEALS List loaded, returning saved data...");
        menuItemsProvider.setComboMealItemList = await getSelectedItemDataList("combo_meals", ItemCategory.combo_meal);
        menuItemsProvider.setComboMealItemListLoaded();
        return menuItemsProvider.comboMealItemList;
    }

    else print("    DEBUG: Logic Error");
    return  [ItemData(price: 9999.99, name: "ERROR", id: "00000",category: ItemCategory.combo_meal)];

  }

  Future<List<ItemData>> getSelectedItemDataList(String tableName, ItemCategory _category) async {
    
    print("DEBUG: Getting $tableName data list");

    List<ItemData> returnValue = List();
    var dataList =  await fetchDatabaseMenuItems(tableName);

    
    for(int x=0;x<dataList.length;x++) {
      ItemData dummy = ItemData(
        id: dataList[x]['item_id'].toString(),
        name: dataList[x]['item_name'].toString(),
        price: dataList[x]['price'],
        category: _category
      );
      // print("   DEBUG: looping - fetched data List values, length: ${dataList.length}, x: $x");
      // print("   DEBUG: " + dataList[x].toString());
      returnValue.add(dummy);
      
      print("   DEBUG: " + dummy.toString());
    }

    return returnValue;

  }

  fetchDatabaseMenuItems(String tableName) async {
    MenuOrderingDatabase db = MenuOrderingDatabase.instance;
    return await db.getDatabaseTableItems(tableName);
  }

  widgetList(List<ItemData> itemDataList) {
    List<Widget> returnValue = List();
    for (int x=0;x<itemDataList.length;x++) {
      returnValue.add(ItemWidget(itemData: itemDataList[x],));
    }

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Wrap(
          direction: Axis.horizontal,
          runSpacing: 10,
          spacing: 10,
          children: returnValue,
          // children: dummyItemList(25),
        ),
      ],
    );
  }





  BoxDecoration itemsBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      border: Border.all(width:1, color: Colors.grey),
      color: Color.fromRGBO(210, 210, 210, 1.0),
    );
  }

  List<Widget> dummyItemList (int _count) {
    List<Widget> returnValue = List();
    ItemData _dummy = ItemData(
      name: "mccrispy chicken fillet ala king w/ rice & fries and drinks and drinks and drinks and drinks and drinks and drinks",
      id: "000000",
      category: ItemCategory.combo_meal,
      price: 9999.99,
    );
    for (int x=0;x<_count;x++) {
      returnValue.add(ItemWidget(itemData: _dummy,));
    }
    return returnValue;
  }

}
