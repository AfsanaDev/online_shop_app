import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../controllers/product_controllers.dart';
import '../models/product.dart';

class AllProductList extends StatelessWidget {
  ProductControllers productControllers = Get.put(ProductControllers());
  AllProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body:Obx(()=>ListView.builder(
        itemBuilder: (context, index){
          var product= productControllers.productList[index];
          return ListTile(
            leading: SizedBox(
              width: 100,
              child: product.url.isNotEmpty ? Image.network("https://demo.alorferi.com${product.url}"):
                  null
            ),
            title: Text(product.name),
            subtitle: Text(product.price.toString()),

          );
        },
        itemCount: productControllers.productList.length,
      )
      ),


    );
  }
}
