import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_demo/exceptions/product_exception.dart';
import 'package:product_demo/models/product.dart';

final productServiceProvider = Provider<ProductService>((ref) {
  return ProductService();
});

class ProductService {
    Future <List<Product>>  getProducts() async {
      try {
        // will call the apis here and handle the response in real integration.
        final String response =
        await rootBundle.loadString('assets/catalog.json');

        final data = await jsonDecode(response);

        // Catalog here can be a model too (Please check my gamesflix code tif you want to see more
        final results = List<Map<String, dynamic>>.from(data['catalogue']);
        List<Product> products = results.map((productData) =>
            Product.fromMap(productData)).toList(growable: false);
        return products;
      } on FlutterError catch (flutterError) {
        throw ProductException.fromFlutterError(flutterError);
      }
  }
}
