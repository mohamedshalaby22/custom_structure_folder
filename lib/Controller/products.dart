import 'package:custom_structure_folder/Constant/app_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Model/all_products.dart';
import '../View/Component/AppWidgets/snack_bar.dart';

class ProductsController extends GetxController {
  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  List<Product> allProducts = [];
  List<Product> cartProducts = [];
  bool isLoaded = false;

  ///////fetchAllProducts
  Future getAllProducts() async {
    isLoaded = false;
    try {
      http.Response response =
          await http.get(Uri.parse('${AppConstant.baseUrl}/products'));
      if (response.statusCode == 200) {
        allProducts = allProductsFromJson(response.body);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
        // debugPrint(e.toString());
      }
    }
    isLoaded = true;
    update();
  }

  ///////addProductsToCart
  void addProductsToCart(Product allProducts, context) {
    if (cartProducts
        .where((element) => element.id == allProducts.id)
        .isNotEmpty) {
      allProducts.quantity++;
    } else {
      cartProducts.add(allProducts);
    }
    SnackBarWidget.showSnackBarWidget(
      context,
      'Added To Cart Successfully!',
      Colors.green[400]!,
    );
    update();
  }

  ///////deleteProductsFromCart
  void deleteProductsFromCart(Product allProducts, context) {
    cartProducts.remove(allProducts);
    SnackBarWidget.showSnackBarWidget(
      context,
      'Deleted From Cart Successfully!',
      Colors.red[200]!,
    );
    update();
  }

  double getTotalPrice() {
    double totalPrices = 0.0;
    for (int i = 0; i < cartProducts.length; i++) {
      totalPrices +=
          cartProducts[i].quantity * double.parse(cartProducts[i].price);
    }

    return double.parse(totalPrices.toStringAsFixed(2));
  }

  void canIncrease(index) {
    if (cartProducts[index].quantity < 9) {
      cartProducts[index].quantity++;
    }
    update();
  }

  void canDecrease(index, context) {
    if (cartProducts[index].quantity == 1) {
      cartProducts.removeAt(index);
      SnackBarWidget.showSnackBarWidget(
        context,
        'Deleted From Cart Successfully!',
        Colors.red[200]!,
      );
    } else {
      if (cartProducts[index].quantity > 0) {
        cartProducts[index].quantity--;
      }
    }

    update();
  }

  bool isItemAdded(int id) {
    return cartProducts.where((element) => element.id == id).isNotEmpty;
  }

  bool canDelete(index) {
    return cartProducts[index].quantity == 1;
  }
}
