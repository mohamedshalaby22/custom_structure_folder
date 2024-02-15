import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/products.dart';
import '../Component/AppWidgets/app_text.dart';
import '../Component/Widgets/cart_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.put(ProductsController()),
        builder: (productsController) => Scaffold(
              body: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
                  child: Visibility(
                    visible: productsController.cartProducts.isNotEmpty,
                    replacement: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 150),
                        child: AppText(
                          text: 'No Items Available',
                        ),
                      ),
                    ),
                    child: ListView.builder(
                        itemCount: productsController.cartProducts.length,
                        itemBuilder: (context, index) {
                          return CartWidget(
                              price:
                                  productsController.cartProducts[index].price,
                              title:
                                  productsController.cartProducts[index].title,
                              image:
                                  productsController.cartProducts[index].image,
                              quantity: productsController
                                  .cartProducts[index].quantity,
                              decrease: () {
                                productsController.canDecrease(index);
                              },
                              increase: () {
                                productsController.canIncrease(index);
                              });
                        }),
                  )),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Visibility(
                  visible: productsController.cartProducts.isNotEmpty,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        AppText(
                          text: 'Total Price:',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600]!,
                        ),
                        const Spacer(),
                        AppText(
                          text: '\$${productsController.getTotalPrice()}',
                          color: Colors.green,
                          fontSize: 17,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
