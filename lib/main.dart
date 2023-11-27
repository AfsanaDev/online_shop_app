import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop_app/pages/all_product_list.dart';

import 'pages/login_page.dart';
import 'pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
      SplashPage(),
      //AllProductList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
