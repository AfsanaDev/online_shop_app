import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart';
import 'package:online_shop_app/constants/endpoints.dart';
import 'package:online_shop_app/pages/all_product_list.dart';
import 'package:online_shop_app/pages/sign_up_page.dart';

import '../constants/urls.dart';
import 'my_product_list_page.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  //String url = '${Urls.apiServerBaseUrl}${EndPoints.login}';
  var url = Uri.parse("https://demo.alorferi.com/oauth/token");

  Future<void> login(String email, password) async {
    try {
      final response = await post(url, body: {
        "client_id": "2",
        "client_secret": "Cr1S2ba8TocMkgzyzx93X66szW6TAPc1qUCDgcQo",
        "grant_type": "password",
        "username": email,
        "password": password,

      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['access_token']);
        Get.offAll(() =>MyProductListPage());
        // AllProductList()
        Get.snackbar('Success', 'Login successful');
        //print("Login successfully");
      } else {
        print("failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "LOGin ",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 34,
                    color: Colors.red),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              GestureDetector(
                onTap: () {
                  login("${emailController.text.toString()}",
                      "${passwordController.text.toString()}");
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.shade100,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: const Center(
                      child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
                ),
              ),
              const SizedBox(
                height: 11,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpPage()));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.shade100,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
