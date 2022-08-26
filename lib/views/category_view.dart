import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/category_model.dart';
import '../models/product_model.dart';
import '../pages/home/home_provider.dart';
import '../pages/order/order_provider.dart';

class CategoryView extends StatelessWidget {
  final Category category;

  const CategoryView({Key? key, required this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context, listen: false);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // #title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // #name
              Text(
                "${category.icon} ${category.name}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              // #see_all
              GestureDetector(
                onTap: () => homeProvider.openProductsPage(context: context, id: category.id),
                child: const Text(
                  "See all",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent),
                ),
              ),
            ],
          ),

          // #products
          SizedBox(
            height: 325,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: homeProvider.getGridSize(category),
              itemBuilder: (context, index) {
                Product product = category.products[index];
                return AspectRatio(
                  aspectRatio: 3 / 5,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // #image
                          Expanded(
                            flex: 16,
                            child: GestureDetector(
                              onTap: () => homeProvider.openDetailPage(context: context, product: product),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(product.images[0]),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                          child: const Icon(
                                            CupertinoIcons.heart,
                                            color: Colors.black,
                                            size: 27.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                    product.discount != null
                                        ? Expanded(
                                            child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Container(
                                                padding: const EdgeInsets.all(5),
                                                transform:
                                                    Matrix4.rotationZ(-pi / 20),
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(7.5),
                                                ),
                                                child: Text(
                                                  "-${product.discount! * 100} %",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // #title
                          Expanded(
                            flex: 4,
                            child: Text(
                              "${product.title} ${product.companyName}",
                              maxLines: 2,
                            ),
                          ),

                          // #price
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                (product.discount != null)
                                    ? Text(
                                        "${product.price} sum",
                                        style: const TextStyle(
                                          fontSize: 13,
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    : const SizedBox.shrink(),
                                Text(
                                  "${product.discount != null ? (product.price - product.price * product.discount!) : product.price} sum",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: product.discount != null ? Colors.red : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // #basket
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Consumer<OrderProvider>(
                                builder: (context, provider, child) {
                                  bool isBooking = provider.checkProduct(product);
                                  return ElevatedButton(
                                    onPressed: () {
                                      if(isBooking) {
                                        provider.removeToCart(product);
                                      } else {
                                        provider.addToCart(product);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: isBooking ? Colors.red.shade600 : Colors.green.shade600,
                                      elevation: 0,
                                      minimumSize: const Size(double.infinity, 30)
                                    ),
                                    child: Text("${!isBooking ? "Add" : "Remove"} to cart", style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                                  );
                                }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
