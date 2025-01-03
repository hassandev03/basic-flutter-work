import 'package:shopping_app/data/products_data.dart';
import 'dart:convert';


List<Product> productsFromJson(String str) => List<Product>.from(
      json.decode(str).map(
        (x) {
          if (!Product._productExists(x['id'].toString())) {
            return Product.fromJson(x);
          }
        },
      ),
    );

class Product {
  final double price;
  final String id, title, imageUrl;

  Product._({
    required this.price,
    required this.title,
    required this.imageUrl,
    required this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product._(
        title: json["title"],
        price: json["price"]?.toDouble() * 278.5,
        imageUrl: json["image"],
        id: json["id"].toString(),
      );

  static bool _productExists(String id) {
    return productsData.any((element) => element.id == id);
  }
}
