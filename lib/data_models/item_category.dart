enum ItemCategory {
  burger,
  beverage,
  combo_meal,
}


  String itemCategoryToString (ItemCategory _x) {
    if(_x==ItemCategory.beverage) return 'beverage';
    else if(_x==ItemCategory.burger) return 'burger';
    else return 'combo_meal';
  } 