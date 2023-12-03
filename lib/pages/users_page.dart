import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_controllers.dart';
import 'all_product_list.dart';
import 'login_page.dart';

class UsersPage extends StatelessWidget {
  UserControllers userControllers = Get.put(UserControllers());
   UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All User"),
      ),
     body: Obx(()=>ListView.builder(
         itemCount: userControllers.userList.length,
         itemBuilder: (context, index){
           var user = userControllers.userList[index];
            return ListTile(
              leading: SizedBox(
                width: 170,
                child: user.url.isNotEmpty ? Image.network("https://demo.alorferi.com${user.url}"):null
              ),
              title: Text("${user.name}"),
            );
         }),
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
              leading: Icon(Icons.shopping_bag_outlined),
              title: Text('My Order'),
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
              leading: Icon(Icons.person_3_rounded),
              title: Text('All User'),
              onTap:(){
                Navigator.pop(context);
              //   Navigator.push(context, MaterialPageRoute(builder: (context)=>AllUserList()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
