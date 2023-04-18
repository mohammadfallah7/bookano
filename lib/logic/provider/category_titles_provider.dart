import 'package:flutter/material.dart';

class CategoryTitlesProvider extends ChangeNotifier {
  int selectedTitleIndex = 0;

  void toggleTitleIndex(int index) {
    selectedTitleIndex = index;

    notifyListeners();
  }
}
