import 'package:flutter/material.dart';

import '../../models/product_model.dart';

class DetailProvider extends ChangeNotifier {
  final Product product;
  int currentIndex = 0;
  PageController pageController = PageController(keepPage: true);

  DetailProvider({required this.product});

  void onSlideImage(int index) {
    currentIndex = index;
    notifyListeners();
  }
}