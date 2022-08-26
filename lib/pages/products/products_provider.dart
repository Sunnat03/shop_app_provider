import 'package:flutter/material.dart';

import '../../models/category_model.dart';
import '../../models/product_model.dart';
import '../../services/mock_data.dart';
import '../detail/datail_page.dart';
import '../order/order_page.dart';
class ProductsProvider extends ChangeNotifier {
  final String categoryId;
  late Category category;

  ProductsProvider({required this.categoryId}) {
    getCategory();
    getProducts();
  }

  void getCategory() {
    category = Category.fromJson(categoriesMock.firstWhere((category) => categoryId == category["id"]));
  }

  void getProducts() {
    category.products = productsMock
        .where((product) => product["categoryId"] == categoryId)
        .map((product) => Product.fromJson(product)).toList();
  }

  void onTapBasket({required BuildContext context}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderPage()));
  }

  void openDetailPage({required BuildContext context, required Product product}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(product: product)));
  }
}