import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'image': image
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(jsonDecode(source));
}