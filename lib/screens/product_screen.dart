import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_demo/screens/product_list.dart';
import 'package:product_demo/widgets/header.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          const Expanded(child: Header()),
          Stack(
            children: <Widget>[
              Column(
                children: [
                  Container(
                    height: 250,
                    width: 500,
                    color: Colors.blueAccent,
                  ),
                  Container(
                    height: 347.7,
                    width: 500,
                    color: Colors.black,
                  )
                ],
              ),
              Container(
                height: 500,
                width: 500,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    )
                ),
                child: const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: ProductList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
