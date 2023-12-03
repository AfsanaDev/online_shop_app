import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop_app/constants/endpoints.dart';
import 'package:online_shop_app/constants/urls.dart';
import '../models/product.dart';

class MyProductController extends GetxController {
  var productList = <Product>[].obs;
  var access_token ="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiNWRkYjgxNjc5ODllMjNlYWM1ODFhYzJkZDMwNDUwMzgzODFlZmI3MzFkN2VhMjIxMDAxZjUwZWJlYmMxODgxZGJkMzFhOTY0NmE4NjQ0OGMiLCJpYXQiOjE3MDA4OTAwNDMuNzA0NTA4LCJuYmYiOjE3MDA4OTAwNDMuNzA0NTEyLCJleHAiOjE3MzI1MTI0NDMuNjc0MzQ0LCJzdWIiOiI0MGUxMDgyYS1mNjU1LTQ0MTEtODVkMy0yMGUxZTU1ZmVkMTQiLCJzY29wZXMiOltdfQ.RqAN1R7KqcLhN1jW-jEkTJjHFtLB8js9YAY_THlxQls7I3JYpGKsKuq28j31Dg3YzhtEAVShhiE0QTLmroUrSOKpYjchLswq5aQm04MGNTEv8yX7IDdwCRfhm-jlS_HffUby_6YW7UrVXip0yvc7fWjgA4Hcb1BN6GZ6AsMhOgU3kvfXyd-zccOrcLirbH964v2GWiAxOAJvzGT5QIo_g0RbtSuXm-DO2tlj3CZ2XeLGhafZXiBrGiRcWhn3VdAWGQRcuAFUMk20se3OzzJKTWAAURDYU7jgSwuq0peqYcqUcR7LCjViOyedqlqQQtIE89lw5DX2U0bDlFCXwJ8SY6qIis5nqTfdE-TluznebbaLOQd1d9EGv9YVlj_Z5bERbmpw1rGFX8hLUQn2FkUNHj1trbufJNiWiqnbW2crWBq7fSdMBVgspyQKl6-MPzjfUa_tVoBFKfvN6z54sqBfNszVXNapXM7pDWAq6KxM28g30kGiIVPYtRLMcygP-vw4CoIGf2BaiN_eEgiGHbkuFCbfUUDxLo10o0Szemm9juu9_bqH1tiPpJzzYeZwzJcQrK0E-1eT75hZmLVVKT_FYrX9mQ2fIxHQPbzqTF53657uo85OUGyLVZ1Q9o6Qupqjh0KJSHbQn6txe6mAehGp1PMLid1U8qR2fTud_kblql8";

  @override
  void onInit() {
    super.onInit();
    fetchProductList();
  }

  Future<void> fetchProductList() async {
    try {
      var url = Uri.parse("${Urls.apiServerBaseUrl}${EndPoints.myProductList}");
      var response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: "Bearer $access_token",
        // "token_type": "Bearer",
        // "Authorization": "Bearer $access_token",
        // "Content-type": "application/json",
        //"refresh_token": "def5020036ae3adc8c364d9142b9ede90a159a438ddd9615d03c91d340a140438bca265a908437a2ee6b15b6270f2bb3f6fc11cf7098ba5ace19298c958cad87455c2ce4ea05c46f80853f51a05501515cab741a006092df0d826300e5917c0f05347dfa4b9a82b5f91d98938e3ea5925b3a1e0e9270a8f2a27dae295fff103e4bea0f3ab802bd3fef3f57b15bfc979883c2cf83979b61420fb903dfb4dc3aa5b081705a84f0632c63e51b1efb169d26ed211cc111438e4059d7d99aaae88c25334b44ba2e2eba1cf16c5cefc0fa60bde944c63d43c0f37cccea89fe13b2fbb98526c1617783bf9e531ccd7e7cd198423492bb5e42edaf8848563ecbbedda0a07cd835fc121f97dd4e1a968b6d6c982357703288048c5a5ec17ace93703bf530156c2c48e6bfb4e729e839f4a4f6b3d9892c02e07b46b88c78edac937c19da3116e81f6bd0717d983c6aca4e237db01ae0e9fac3fb2055696c3259f7430dbe0b734dc7034e5ea545d540885fb6f16ec8c98717d23510cda090e3e3c1a4b7ee98de3951618e56",
      });
      if (response.statusCode == 200) {
        //print(response.body);
        Map<String, dynamic> dataMap = jsonDecode(response.body);
        // print(dataMap.runtimeType);
        List<dynamic> jsonList = dataMap['data'];
        for (var element in jsonList) {

          // var url = "" ;
          // if(element['url']) {
          //   url = element['url'] ;
          // }
          productList.value.add(Product(
              id: element['id'],
              name: element['name'],
              url: element['url'] ?? "/images/blank_product_picture.png",
              stock_quantity: element['stock_quantity'].toString(),
              price: element['price']));

        }
        productList.refresh();
        print(productList.value);
      } else {
        print("failed");
      }
    } catch (e, s) {
      print("Error: $e, Stack Trace : $s");
    }
  }
}
