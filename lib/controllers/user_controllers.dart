import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserControllers extends GetxController{
  var userList =<User>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchUserList();
  }
  Future<void>fetchUserList()async{
    try{
      var url = Uri.parse("https://demo.alorferi.com/api/users");
      var response = await http.get(url);
      if(response.statusCode ==200){
        Map<String, dynamic> dataMap = jsonDecode(response.body.toString());
        List<dynamic> jsonList = dataMap['data'];
        for( var data in jsonList){
          userList.value.add(User(id: data['id'],
              name: data['name'],
              url: data['url'] ?? ""
          ));
        }
        userList.refresh();
      }
    }catch(e,s){
        print("Error :$e Stack trace $s");
    }
  }

}