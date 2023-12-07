import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:online_shop_app/pages/all_product_list.dart';

class SignUpPage extends StatelessWidget {
  
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  SignUpPage({super.key});
  var url = Uri.parse("https://demo.alorferi.com/api/register");

  Future<void> signUp(String name,email, password)async{
    try{
      final response = await post(url,body: {
        "name" : name,
        "email":  email,
        "password": password,
        "password_confirmation": "confirm password"
      });
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        // Get.offAll(()=>AllProductList());
        print(data);
        Get.snackbar('Success', 'Sign Up successful');
      }else{
        print('Failed');
      }

    }catch(e,s){
     print(e.toString());
    }
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in form"),
      ),
      body: Center(
        child: Container(
          width: 260,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign Up",style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w900,
                color: Colors.red
              ),),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "User Name",
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
              SizedBox(height: 11,),
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
              SizedBox(height: 11,),
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
              SizedBox(height: 11,),
              GestureDetector(
                onTap: (){
                  signUp(
                    "${nameController.text.toString()}",
                    "${emailController.text.toString()}",
                    "${passwordController.text.toString()}",
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.shade100,
                    borderRadius: BorderRadius.circular(11)
                  ),
                  child: Center(
                    child: Text('Sign Up',style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                    ),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
