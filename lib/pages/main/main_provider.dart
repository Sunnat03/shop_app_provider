import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  PageController pageController = PageController(keepPage: true);
  int currentPage = 0;

  void onTapNavigatorIcon(int index) {
    currentPage = index;
    pageController.jumpToPage(index);
    notifyListeners();
  }

  void onPageChanged(int index) {
    currentPage = index;
    notifyListeners();
  }
}