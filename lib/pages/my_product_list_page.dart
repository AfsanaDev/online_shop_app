import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop_app/pages/add_product_page.dart';
import 'package:http/http.dart' as http;
import '../controllers/my_product_controller.dart';
import '../models/product.dart';
import 'all_product_list.dart';
import 'edit_product_page.dart';
import 'login_page.dart';
import 'my_order_page.dart';
import 'users_page.dart';

class MyProductListPage extends StatelessWidget {
  MyProductController myProductController = Get.put(MyProductController());

  MyProductListPage({super.key});

  var access_token ="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiNWRkYjgxNjc5ODllMjNlYWM1ODFhYzJkZDMwNDUwMzgzODFlZmI3MzFkN2VhMjIxMDAxZjUwZWJlYmMxODgxZGJkMzFhOTY0NmE4NjQ0OGMiLCJpYXQiOjE3MDA4OTAwNDMuNzA0NTA4LCJuYmYiOjE3MDA4OTAwNDMuNzA0NTEyLCJleHAiOjE3MzI1MTI0NDMuNjc0MzQ0LCJzdWIiOiI0MGUxMDgyYS1mNjU1LTQ0MTEtODVkMy0yMGUxZTU1ZmVkMTQiLCJzY29wZXMiOltdfQ.RqAN1R7KqcLhN1jW-jEkTJjHFtLB8js9YAY_THlxQls7I3JYpGKsKuq28j31Dg3YzhtEAVShhiE0QTLmroUrSOKpYjchLswq5aQm04MGNTEv8yX7IDdwCRfhm-jlS_HffUby_6YW7UrVXip0yvc7fWjgA4Hcb1BN6GZ6AsMhOgU3kvfXyd-zccOrcLirbH964v2GWiAxOAJvzGT5QIo_g0RbtSuXm-DO2tlj3CZ2XeLGhafZXiBrGiRcWhn3VdAWGQRcuAFUMk20se3OzzJKTWAAURDYU7jgSwuq0peqYcqUcR7LCjViOyedqlqQQtIE89lw5DX2U0bDlFCXwJ8SY6qIis5nqTfdE-TluznebbaLOQd1d9EGv9YVlj_Z5bERbmpw1rGFX8hLUQn2FkUNHj1trbufJNiWiqnbW2crWBq7fSdMBVgspyQKl6-MPzjfUa_tVoBFKfvN6z54sqBfNszVXNapXM7pDWAq6KxM28g30kGiIVPYtRLMcygP-vw4CoIGf2BaiN_eEgiGHbkuFCbfUUDxLo10o0Szemm9juu9_bqH1tiPpJzzYeZwzJcQrK0E-1eT75hZmLVVKT_FYrX9mQ2fIxHQPbzqTF53657uo85OUGyLVZ1Q9o6Qupqjh0KJSHbQn6txe6mAehGp1PMLid1U8qR2fTud_kblql8";

  Future<void> deleteProduct( Product product) async{
    try{
      var url = Uri.parse("https://demo.alorferi.com/api/my-products/${product.id}");
      var response = await http.delete(url,
          headers: {
            "Authorization": "Bearer $access_token"
          });
      if( response.statusCode == 200){
        Get.snackbar('successful', ' Product delete successfully');
        // print('Product deleted successfully');
      }else{
        Get.snackbar('Failed', 'Failed to delete product. Status code: ${response.statusCode}');
        // Optionally, you can check the response body for more information
        print('Response body: ${response.body}');
      }
    }catch(e){
      print("Error are $e");
    }

  }

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
                              deleteProduct(product);
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

