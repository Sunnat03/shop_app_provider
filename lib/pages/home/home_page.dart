import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/pages/home/home_provider.dart';

import '../../views/category_view.dart';
import '../order/order_provider.dart';

class HomePage extends StatelessWidget {
  static const id = "/home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, widget) {

        var homeProvider = Provider.of<HomeProvider>(context, listen: false);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text("Home", style: TextStyle(color: Colors.black),),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () => homeProvider.onTapBasket(context: context),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.shopping_cart, color: Colors.black, size: 35,),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Consumer<OrderProvider>(
                          builder: (context, order, child) {
                            return Text(order.orderNumber.toString(), style: const TextStyle(color: Colors.white),);
                          }
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          body: ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: homeProvider.categories.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CategoryView(category: homeProvider.categories[index]);
            },
          ),
        );
      },
    );
  }
}
