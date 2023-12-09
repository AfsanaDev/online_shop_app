import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop_app/pages/add_product_page.dart';

import '../controllers/my_product_controller.dart';
import 'all_product_list.dart';
import 'edit_product_page.dart';
import 'login_page.dart';
import 'my_order_page.dart';
import 'users_page.dart';

class MyProductListPage extends StatelessWidget {
  MyProductController myProductController = Get.put(MyProductController());

  MyProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My product list"),
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: myProductController.productList.length,
            itemBuilder: (context, index) {
              var product = myProductController.productList[index];
              return Card(
                child: ListTile(
                    title: Text(product.name),
                    leading: SizedBox(
                      width: 160,
                      height: 60,
                      child: Image.network(
                          "https://demo.alorferi.com${product.url.toString()}"),
                    ),
                    subtitle: Text(product.price.toString()),
                    trailing: Column(
                      children: [

                         Padding(
                           padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                           child: SizedBox(
                              // width: 40,
                              height: 8,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const EditProductPage()));
                                },
                                    icon: const Icon(Icons.edit),
                              ),
                            ),
                         ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: SizedBox(
                            height: 8,
                            child: IconButton(onPressed: (){

                            }, icon: const Icon(Icons.delete)),
                          ),
                        )
                      ],
                    )),
              );
            }),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: const Text('Online Shop'),
                accountEmail: Image.asset('assets/images/logo.png')),
            ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: const Text('My Product'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: const Text('My Order'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyOrderPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.collections_bookmark_rounded),
              title: const Text('All Product'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllProductList()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_3_rounded),
              title: const Text('All User'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UsersPage()));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => const AddProductPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}