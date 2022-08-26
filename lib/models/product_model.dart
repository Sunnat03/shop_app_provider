class Product {
  late String id;
  late num price;
  late String title;
  String? description;
  late String categoryId;
  late List<String> images;
  late String createdDate;
  late String size;
  double? discount;
  String? companyName;

  Product({
    required this.id,
    required this.price,
    required this.title,
    this.description,
    required this.categoryId,
    required this.images,
    required this.createdDate,
    required this.size,
    this.companyName,
    this.discount,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    price = json["price"];
    title = json["title"];
    description = json["description"];
    categoryId = json["categoryId"];
    images = json["images"];
    createdDate = json["createdDate"];
    size = json["size"];
    id = json["id"];
    companyName = json["companyName"];
    discount = json["discount"];
  }

  Map<String,dynamic> toJson() {
    Map<String,dynamic> map = {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'categoryId': categoryId,
      'images': images,
      'createdDate': createdDate,
      'size': size,
      'companyName': companyName,
      'discount': discount,
    };
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
