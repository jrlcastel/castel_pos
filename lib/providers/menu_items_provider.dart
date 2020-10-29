import 'package:castel_pos/data_models/item_category.dart';
import 'package:castel_pos/data_models/item_data.dart';
import 'package:castel_pos/data_models/order_list_item.dart';
import 'package:flutter/material.dart';

class MenuItemsProvider extends ChangeNotifier {

  notify() {
    notifyListeners();
  }

  // resets the order data to accommodate new order
  // WARN: this methods rebuilds subscribed widgets
  resetValues() {
    resetSelectedItemCategory(notify: false);
    // _selectedItemID = "";
    _selectedItemCount = 1;
    _beverageItemListLoaded = false;
    _burgerItemListLoaded = false;
    _comboMealItemListLoaded = false;
    notifyListeners();
  }

  int _selectedItemCount = 1;
  
  get selectedItemCount => _selectedItemCount;

  void resetSelectedItemCount () {
    _selectedItemCount = 1;
  }

  void increaseSelectedItemCount() {
    if(_selectedItemCount<999) {
      _selectedItemCount++;
      notifyListeners();
    }
  }

  void decreaseSelectedItemCount() {
    if(_selectedItemCount>1) {
      _selectedItemCount--;
      notifyListeners();
    }
  }







  // String _selectedItemID = "";

  // resetSelectedID () {
  //   _selectedItemID = "";
  // }

  // get selectedItemID => _selectedItemID;

  // set setSelectedItemID(String _newValue) {
  //   _selectedItemID = _newValue;
  //   _selectedItemCount = 1;
  //   notifyListeners();
  // }






  bool _beverageItemListLoaded = false;
  get beverageItemListLoaded =>_beverageItemListLoaded;
  void setBeverageItemListLoaded () {
    _beverageItemListLoaded = true;
  }

  

  bool _burgerItemListLoaded = false;
  get burgerItemListLoaded =>_burgerItemListLoaded;
  void setBurgerItemListLoaded () {
    _burgerItemListLoaded = true;
  }



  bool _comboMealItemListLoaded = false;
  get comboMealItemListLoaded =>_comboMealItemListLoaded;
  void setComboMealItemListLoaded () {
    _comboMealItemListLoaded = true;
  }


  ItemData _selectedItemData;
  get selectedItemData => _selectedItemData;
  set setSelectedItemData (ItemData _newValue) {
     _selectedItemData = _newValue;
     _selectedItemCount = 1;
     notifyListeners();
  }
  
  resetSelectedItemData () {
     _selectedItemData = ItemData(price: 0.0, name: "", id: "", category: ItemCategory.burger);
     resetSelectedItemCount();
     notifyListeners();
  }




  ItemCategory _selectedCategory = ItemCategory.burger;

  get selectedCategory => _selectedCategory;

  set setSelectedItemCategory(ItemCategory _newCategory) {
    _selectedCategory = _newCategory;
    notifyListeners();
  }

  resetSelectedItemCategory({@required bool notify}) {
    _selectedCategory = ItemCategory.burger;
    if (notify) notifyListeners();
  }







  List<ItemData> _burgerItemList = List();
  
  get burgerItemList => _burgerItemList;

  set setBurgerItemList(List<ItemData> _newValue) {
    _burgerItemList=_newValue;
    _burgerItemListLoaded = true;
  }

  void addToBurgerItemList(ItemData _newItem) {
    _burgerItemList.add(_newItem);
    notifyListeners();
  }

  // void clearBurgerItemList() {
  //   _burgerItemList = List();
  //   notifyListeners();
  // }


  

  List<ItemData> _beverageItemList = List();
  
  get beverageItemList => _beverageItemList;

  set setBeverageItemList(List<ItemData> _newValue) {
    _beverageItemList=_newValue;
    _beverageItemListLoaded = true;
  }

  void addToBeverageItemList(ItemData _newItem) {
    _beverageItemList.add(_newItem);
    notifyListeners();
  }

  // void clearBeverageItemList() {
  //   _beverageItemList = List();
  //   notifyListeners();
  // }




  List<ItemData> _comboMealItemList = List();
  
  get comboMealItemList => _comboMealItemList;

  set setComboMealItemList(List<ItemData> _newValue) {
     _comboMealItemList=_newValue;
     _comboMealItemListLoaded = true;
  }

  void addToComboMealItemList(ItemData _newItem) {
    _comboMealItemList.add(_newItem);
    notifyListeners();
  }

  // void clearComboMealItemList() {
  //   _comboMealItemList = List();
  //   notifyListeners();
  // }







}