import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../View/Pages/cart_page.dart';
import '../View/Pages/home_page.dart';

class BNBar extends GetxController {
  List<Widget> screens = [
    const HomePage(),
    const CartPage(),
  ];
  int selectedIndex = 0;
  void changeIndex(int index) {
    selectedIndex = index;
    update();
  }
}
