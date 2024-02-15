import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View/Pages/home_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey[300]),
      home: const HomeLayout(),
    );
  }
}
