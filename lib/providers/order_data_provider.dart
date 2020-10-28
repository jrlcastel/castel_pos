import 'package:castel_pos/data_models/item_category.dart';
import 'package:castel_pos/data_models/order_list_item.dart';
import 'package:flutter/material.dart';

class OrderDataProvider extends ChangeNotifier {

  // resets the order data to accommodate new order
  // WARN: this methods rebuilds subscribed widgets
  resetValues() {
    resetOrderList(notify: false);
    resetSelectedItemCategory(notify: false);
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





  List<OrderListItemData> _orderList = List();
  
  List<OrderListItemData> get orderList => _orderList;

  void setOrderList({@required List<OrderListItemData> newValue, @required bool notify}) {
    _orderList = newValue;
    if(notify) notifyListeners();
  }

  void resetOrderList({@required bool notify}) {
    _orderList = List();
    if(notify) notifyListeners();
  }

  void addToOrderList(OrderListItemData _newValue) {
    _orderList.add(_newValue);
    notifyListeners();
  }

  void removeFromOrderList(int _index) {
    _orderList.removeAt(_index);
    notifyListeners();
  }





  double get total => calculateTotal();

  double calculateTotal() {
    double _returnValue = 0;

    for(int x=0;x<_orderList.length;x++)
      _returnValue += _orderList[x].totalPrice;

    return _returnValue;
  }





}