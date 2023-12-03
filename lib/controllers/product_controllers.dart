import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/endpoints.dart';
import '../constants/urls.dart';
import '../models/product.dart';

class ProductControllers extends GetxController {
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProductList();
  }

  Future<void> fetchProductList() async {
    try {
      var url = Uri.parse("https://demo.alorferi.com/api/products");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> dataMap = jsonDecode(response.body.toString());
        List<dynamic> jsonList = dataMap['data'];
        for (var element in jsonList) {
          productList.value.add(Product(
              id: element['id'],
              name: element['name'],
              url:  element['url'] ?? "/images/blank_product_picture.png",
              stock_quantity:  element['stock_quantity'].toString(),
              price: element['price']));
        }
        productList.refresh();
      }
    } catch (e,s) {
      print('Error $e , stack trace $s');
    }
  }
}
