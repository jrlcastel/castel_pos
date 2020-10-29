import 'package:castel_pos/data_models/discount.dart';
import 'package:castel_pos/data_models/item_category.dart';
import 'package:castel_pos/data_models/item_data.dart';
import 'package:castel_pos/data_models/order_list_item.dart';
import 'package:flutter/material.dart';

class OrderDataProvider extends ChangeNotifier {

  // resets the order data to accommodate new order
  // WARN: this methods rebuilds subscribed widgets
  resetValues() {
    _selectedDiscount = 0;
    _discount = 0;
    resetOrderList(notify: false);
    notifyListeners();
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

  void addToOrderList(ItemData _newValue, int count) {

    int x;

    for(x=0;x<_orderList.length;x++) {
      if(_orderList[x].item.isTheSameAs(_newValue)) {
        _orderList[x].qty += count;
        break;
      }
    }

    if(x==_orderList.length) {
      _orderList.add(OrderListItemData(item: _newValue, qty: count));
    }

    notifyListeners();
  }

  void removeFromOrderList(ItemData _newValue) {
    
    for(int x=0;x<_orderList.length;x++) {
      if(_orderList[x].item.isTheSameAs(_newValue)) {
        _orderList.removeAt(x);
        break;
      }
    }
    notifyListeners();
  }





  int _discount = 0;
  int get discount => _discount;
  set setDiscount(int _newDiscountValue) {
    _discount = _newDiscountValue;
    notifyListeners();
  }


  int _selectedDiscount = 0;
  int get selectedDiscount => _selectedDiscount;
  set setSelectedDiscount(int _newDiscountValue) => _selectedDiscount = _newDiscountValue;


  bool _discountListLoaded = false;
  bool get discountListLoaded => _discountListLoaded;
  set setDiscountListLoaded(bool _bool) => _discountListLoaded = _bool;


  List<Discount> _discountList = List();
  get discountList => _discountList;
  void setDiscountList(List<Discount> _newDiscountList, bool notify) {
    _discountList = _newDiscountList;
    if(notify) notifyListeners();
  }

  double get total => calculateTotal();

  double calculateTotal() {
    double _returnValue = 0;

    for(int x=0;x<_orderList.length;x++)
      _returnValue += _orderList[x].totalPrice;

    return _returnValue - (_returnValue*(_discount/100));
    
  }

  double get subTotal => calculateSubTotal();

  double calculateSubTotal() {
    double _returnValue = 0;

    for(int x=0;x<_orderList.length;x++)
      _returnValue += _orderList[x].totalPrice;

    return _returnValue;
    
  }





}