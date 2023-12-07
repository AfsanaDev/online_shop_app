import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop_app/pages/login_page.dart';
import 'package:online_shop_app/pages/sign_up_page.dart';

import 'all_product_list.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) =>AllProductList()));
      // AllProductList()
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent.shade100,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 220,
              child: Image.asset('assets/images/splash_img.png'),
            ),
            const SizedBox(
              height: 11,
            ),
            const Text(
              'Buy What You Want',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        )),
      ),
    );
  }
}
