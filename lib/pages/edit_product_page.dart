import 'package:flutter/material.dart';
import 'package:online_shop_app/pages/users_page.dart';

import 'all_product_list.dart';
import 'login_page.dart';
import 'my_order_page.dart';

class EditProductPage extends StatelessWidget {
  const EditProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
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
    );
  }
}
