
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_demo/exceptions/product_exception.dart';
import 'package:product_demo/models/product.dart';
import 'package:product_demo/services/product_service.dart';
import 'package:product_demo/widgets/error.dart';
import 'package:product_demo/widgets/product_box.dart';

final productFutureProvider =
    FutureProvider.autoDispose<List<Product>>((ref) async {
  ref.maintainState = true;

  final productService = ref.watch(productServiceProvider);
  final products = productService.getProducts();
  return products;
});

class ProductList extends ConsumerWidget {
  const ProductList({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Container(
      child: ref.watch(productFutureProvider).when(
        error: (e, s) {
          if (e is ProductException) {
            return ErrorBody(message: '${e.message}');
          }
          return const ErrorBody(
              message: "Oops, something unexpected happened");
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (products) {
          return RefreshIndicator(
            onRefresh: () async {
              return ref.refresh(productFutureProvider);
            },
            child: GridView.extent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.7,
              children:
              products.map((product) => ProductBox(product: product)).toList(),
            ),
          );
        },
      ),
    );
  }
}



