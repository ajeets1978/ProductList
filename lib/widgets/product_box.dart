import 'package:flutter/material.dart';
import 'package:product_demo/models/product.dart';
import 'package:product_demo/widgets/front_banner.dart';

class ProductBox extends StatelessWidget {
  final Product product;

  const ProductBox({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          product.image,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: FrontBanner(text: product.title),
        ),
      ],
    );
  }
}