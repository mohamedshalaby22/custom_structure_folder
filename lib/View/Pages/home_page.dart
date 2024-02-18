import 'dart:math';

import 'package:custom_structure_folder/Controller/products.dart';
import 'package:custom_structure_folder/Utils/extensions.dart';
import 'package:custom_structure_folder/View/Component/AppWidgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Component/AppWidgets/app_search_form.dart';
import '../Component/Widgets/products_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              80.height,
              Icon(
                Icons.menu,
                color: Colors.grey[700],
              ),
              20.height,
              const AppSearchForm(),
              25.height,
              SizedBox(
                width: double.infinity,
                child: AppText(
                  text: 'everyone files... some fly longer than others',
                  textAlign: TextAlign.center,
                  color: Colors.grey[600]!,
                ),
              ),
              35.height,
              const AppText(
                text: 'All Products',
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              GetBuilder(
                init: Get.put(ProductsController()),
                builder: (productsController) => Visibility(
                  visible: productsController.isLoaded,
                  replacement: const Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: Center(
                      child: CupertinoActivityIndicator(
                        radius: 12,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      ...List.generate(
                        productsController.allProducts.length,
                        (index) => SingleChildScrollView(
                          child: ProductsWidget(
                            price: productsController.allProducts[index].price,
                            title: productsController.allProducts[index].title,
                            image: productsController.allProducts[index].image,
                            isAdded: productsController.isItemAdded(
                                productsController.allProducts[index].id),
                            onAdd: () {
                              productsController.addProductsToCart(
                                productsController.allProducts[index],
                                context,
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
