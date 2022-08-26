import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/pages/detail/detail_provider.dart';

import '../../models/product_model.dart';
import '../order/order_provider.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailProvider(product: product),
      builder: (context, child) {

        var detail = Provider.of<DetailProvider>(context, listen: false);
        var orderProvider = Provider.of<OrderProvider>(context, listen: false);
        var order = orderProvider.getOrder(product);

        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // #image
              Expanded(
                flex: 4,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView(
                      onPageChanged: detail.onSlideImage,
                      controller: detail.pageController,
                      children: product.images.map((image) {
                        return Image(
                          image: NetworkImage(image),
                          fit: BoxFit.contain,
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Consumer<DetailProvider>(
                        builder: (context, provider, child) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              product.images.length,
                                  (index) {
                                return AnimatedContainer(
                                  margin: const EdgeInsets.symmetric(horizontal: 2),
                                  duration: const Duration(milliseconds: 200),
                                  height: 7.5,
                                  width: index == detail.currentIndex ? 20 : 7.5,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(3.75),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),

              // #title
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO: write your code
                        },
                        child: const Image(
                          height: 35,
                          width: 35,
                          image: AssetImage("assets/icons/heart_icon.png"),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // #desctiption
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        product.description ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          const TextSpan(
                              text: "Size: ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          TextSpan(
                            text: product.size,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
              ),

              // #quantity
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Quantity",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      // #buttons
                      Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width * 1 / 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22.5),
                            color: Colors.grey.shade300),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // #minus
                            GestureDetector(
                              onTap: () => orderProvider.minus(order),
                              child: const Icon(CupertinoIcons.minus),
                            ),

                            // #quantity
                            Consumer<OrderProvider>(
                                builder: (context, provider, child) {
                                  order = provider.getOrder(product);
                                  return Text(
                                    order.quantity.toString(),
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  );
                                }
                            ),

                            // #plus
                            GestureDetector(
                              onTap: () => orderProvider.plus(order),
                              child: const Icon(CupertinoIcons.plus),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  height: 2,
                  color: Colors.black,
                ),
              ),

              // #add_to_cart
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Total price",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Consumer<OrderProvider>(
                            builder: (context, provider, child) {
                              order = provider.getOrder(product);
                              return Flexible(
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                                      text:"${order.total}"),
                                ),
                              );
                            }
                          ),
                        ],
                      ),
                      Consumer<OrderProvider>(
                        builder: (context, provider, child) {
                          order = orderProvider.getOrder(product);
                          return MaterialButton(
                            onPressed: () {
                              if(order.quantity > 0) {
                                provider.removeToCart(product, quantity: order.quantity);
                              } else {
                                provider.addToCart(product);
                              }
                            },
                            color: Colors.black,
                            height: 55,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(27.5)
                            ),
                            minWidth: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              "${order.quantity == 0 ? "Add" : "Remove"} to cart",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
