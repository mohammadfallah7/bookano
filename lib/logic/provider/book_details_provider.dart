import 'package:flutter/material.dart';

class BookDetailsProvider extends ChangeNotifier {
  int selectedTabIndex = 0;

  void toggleTabIndex(int index) {
    selectedTabIndex = index;

    notifyListeners();
  }
}
