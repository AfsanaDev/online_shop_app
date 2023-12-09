import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/models/product.dart';

class SingleProductPage extends StatelessWidget {
  final Product product;
  SingleProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single Product Page'),
      ),
    );
  }
}
