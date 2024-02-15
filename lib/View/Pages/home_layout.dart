import 'package:custom_structure_folder/Controller/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.put(BNBar()),
        builder: (controller) => Scaffold(
              backgroundColor: Colors.grey[300],
              bottomNavigationBar: SafeArea(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 80),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25)),
                  child: BottomNavigationBar(
                    showUnselectedLabels: false,
                    currentIndex: controller.selectedIndex,
                    onTap: (index) {
                      controller.changeIndex(index);
                    },
                    backgroundColor: Colors.transparent,
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: true,
                    unselectedItemColor: Colors.grey[400],
                    selectedItemColor: Colors.grey[700],
                    unselectedLabelStyle:
                        const TextStyle(color: Colors.transparent),
                    elevation: 0.0,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.shopping_bag), label: 'Cart'),
                    ],
                  ),
                ),
              ),
              body: controller.screens[controller.selectedIndex],
            ));
  }
}
