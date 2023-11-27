import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/my_product_controller.dart';

class MyProductListPage extends StatelessWidget {
  MyProductController myProductController = Get.put(MyProductController());

  MyProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My product list"),
      ),
      body: Obx(()=>ListView.builder(
          itemCount: myProductController.productList.length,
          itemBuilder: (context, index) {
            var product = myProductController.productList[index];
            return Card(
              child:ListTile(
                title: Text(product.name),
                leading: SizedBox(
                  width: 60,
                  height: 30,
                  child: Image.network(
                    "https://demo.alorferi.com${product.url.toString()}"),
                ),
                subtitle: Text(product.price.toString()),
              ),
            );
          }),
      ),
    );
  }
}
