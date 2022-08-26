
import 'package:shop_app_provider/models/product_model.dart';

class Category {
  late String id;
  late String name;
  late String icon;
  late List<Product> products;
  late List<String> productsId;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    this.products = const [],
    required this.productsId,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    icon = json["icon"];
    productsId = json["products"];
    products = [];
    // products = json["products"].map((element) => Product.fromJson(element)).toList();
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "products": productsId,
        // "products": products.map((element) => element.toJson()).toList(),
      };
}
