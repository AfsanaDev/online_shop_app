import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop_app/pages/login_page.dart';
import 'package:online_shop_app/pages/my_product_list_page.dart';

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
      body:
      Obx(()=>ListView.builder(
        itemBuilder: (context, index){
          var product= productControllers.productList[index];
          return ListTile(
            leading: SizedBox(
              width: 160,
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
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('Online Shop'),
                accountEmail: Image.asset('assets/images/logo.png')),
             ListTile(
             leading: const Icon(Icons.shopping_bag_outlined),
              title: const Text('My Product'),
             onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
             },
            ),
             ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: const Text('My Order'),
              // onTap: (){
              //   Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOrederPage()));
              // },
            ),
             ListTile(
              leading: const Icon(Icons.collections_bookmark_rounded),
              title: const Text('All Product'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AllProductList()));
              },
            ),
             ListTile(
              leading: const Icon(Icons.person_3_rounded),
               title: const Text('All User'),
               // onTap:(){
               //   Navigator.push(context, MaterialPageRoute(builder: (context)=>AllUserList()));
               // },
            ),
          ],
        ),
      ),

    );
  }
}
