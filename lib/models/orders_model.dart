
import 'package:shop_app_provider/models/order_model.dart';

class OrdersModel {
  late String id;
  late List<Order> orders;
  late String createTime;
  String? updateTime;
  late double total;

  OrdersModel({
    required this.id,
    required this.orders,
    required this.createTime,
    this.updateTime,
    required this.total,
  });

  OrdersModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    orders = json["orders"];
    createTime = json["createTime"];
    updateTime = json["updateTime"];
    total = json["total"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "orders": orders,
        "createTime": createTime,
        "updateTime": updateTime,
        "total": total,
      };
}
