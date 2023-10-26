import "package:flutter/material.dart";

class BottomSheetProvider with ChangeNotifier {
  final List<int> _selectedItems = [];

  List<int> get selectedItems => _selectedItems;

  // Add an item to the selected items list
  void selectItem(int index) {
    if (!_selectedItems.contains(index)) {
      _selectedItems.add(index);
      print(_selectedItems);
      notifyListeners();
    }
  }

  // Remove an item from the selected items list
  void deselectItem(int index) {
    if (_selectedItems.contains(index)) {
      _selectedItems.remove(index);
      print(_selectedItems);
      notifyListeners();
    }
  }

  static const int min = 5;
  int max = min;
  String message = "اظهر المزيد";

  void showMore(int len) {
    if (max == len) {
      max = min;
      message = "اظهر المزيد";
    } else {
      max = len;
      message = "عرض أقل^";
    }
    notifyListeners();
  }
}
