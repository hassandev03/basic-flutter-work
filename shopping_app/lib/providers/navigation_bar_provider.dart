import 'package:flutter/material.dart';

class NavigationBarProvider with ChangeNotifier {
  int _selectedWidgetIndex = 0;

  int get selectedWidgetIndex => _selectedWidgetIndex;

  set selectedWidgetIndex(int index) {
    _selectedWidgetIndex = index;
    notifyListeners();
  }
}
