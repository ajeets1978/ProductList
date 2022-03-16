// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:product_demo/main.dart';
import 'package:product_demo/widgets/header.dart';
import 'package:product_demo/widgets/top_menu.dart';

class Repository {
  Future<List<Product>> getProducts() async => [];
}

class Product {
  int id;
  String title;
  String description;
  String price;
  String image;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image
  });
}

final repositoryProvider = Provider((ref) => Repository());

final productFutureProvider = FutureProvider((ref) async{
  final repository = ref.read(repositoryProvider);

  return repository.getProducts();
});

class FakeRepository implements Repository {
  @override
  Future<List<Product>> getProducts() async {
    return [
      Product(id: 22, title: 'Adidas', description: 'Shoe', image: 'someurl', price: '180.00'),
    ];
  }

}

class ProductBox extends StatelessWidget {
  const ProductBox({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Text(product.title);
  }
}

void main() {
  testWidgets('App renders', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ProviderScope(overrides: [
      repositoryProvider.overrideWithValue(FakeRepository())
    ],child: MyApp()));
    expect(find.byType(TopMenu), findsOneWidget);
    expect(find.byType(Header), findsOneWidget);
  });


   testWidgets('Provider test', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          repositoryProvider.overrideWithValue(FakeRepository())
        ],
        // Our application, which will read from productFutureProvider to display the product list
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(builder: (context, ref, _) {
              final products = ref.watch(productFutureProvider);
              // The list of product is loading or in error
              if (products.asData == null) {
                return const CircularProgressIndicator();
              }
              return ListView(
                children: [
                  for (final product in products.asData!.value) ProductBox(product: product)
                ],
              );
            }),
          ),
        ),
      ),
    );

    // The first frame is a loading state.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Re-render.
    await tester.pump();

    // No longer loading
    expect(find.byType(CircularProgressIndicator), findsNothing);

    // Rendered one Product Items with the data returned by FakeRepository
    expect(tester.widgetList(find.byType(ProductBox)), [
      isA<ProductBox>()
          .having((s) => s.product.id, 'product.id', 22)
          .having((s) => s.product.title, 'product.title', 'Adidas')
          .having((s) => s.product.description, 'product.description', 'Shoe'),
    ]);
  });
}
