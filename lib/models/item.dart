// ignore_for_file: prefer_final_fields, unused_field, unused_local_variable
import 'package:flutter/material.dart';
import '../data/items_info.dart';

class ItemCategory {
  final String _name;
  int _availableItems;
  String _imgPath;
  List<ItemSubCategory> _items;

  ItemCategory(
      {required String name,
      required int totalItems,
      required List<ItemSubCategory> items,
      required String imgPath
      })
      : _name = name,
        _availableItems = totalItems,
        _items = items,
        _imgPath = imgPath;

  String get getName => _name;
  int get getNumberOfItems => _availableItems;
  String get getImage => _imgPath;
  List<ItemSubCategory> get getItemSubList => _items;
}

class ItemSubCategory {
  String _name;
  int _availableItems;
  List<Item> _items;

  ItemSubCategory(
      {required String name,
      required int totalItems,
      required List<Item> items})
      : _name = name,
        _availableItems = totalItems,
        _items = items;

  List<Item> get getItemList => _items;
  String get getName => _name;
  int get getNumberOfItems => _availableItems;
}

class Item {
  String _name;
  IconData _icon;
  int _addedCount = 0;
  String _size = 'S';

  Item({required String name, required IconData icon})
      : _name = name,
        _icon = icon;

  String get getName => _name;
  IconData get getIcon => _icon;
  int get getAddedCount => _addedCount;
  String get getSize => _size;
  set setSize(String size){
    _size = size;
  }
  void increaseCount(){
    _addedCount++;
  }
  void decreaseCount(){
    _addedCount--;
  }
}

List<ItemCategory> getData() {
  List<ItemCategory> finalList = [];
  for (var itemCategory in items) {
    var itemSubCategoryList = itemCategory['itemSubCategory']!;
    List<ItemSubCategory> itemSubList = [];
    for (var itemSubCategory in itemSubCategoryList as List) {
      var itemsList = itemSubCategory['items'];
      List<Item> itemList = [];
      for (var item in itemsList) {
        itemList.add(Item(name: item['itemName'], icon: item['itemIcon']));
      }
      itemSubList.add(ItemSubCategory(name: itemSubCategory['itemSubCategoryName'], totalItems: itemSubCategory['itemSubCategoryCount'], items: itemList));
    }
    finalList.add(ItemCategory(name: itemCategory['itemCategoryName'].toString(), totalItems: int.parse(itemCategory['itemCategoryCount'].toString()), imgPath: itemCategory['itemCategoryImage'].toString(),items: itemSubList));
  }
  return finalList;
}
