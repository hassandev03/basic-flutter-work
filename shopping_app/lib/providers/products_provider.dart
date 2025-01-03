import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/data/products_data.dart';
import 'package:shopping_app/models/product.dart';

class ProductsProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> fetchProducts() async {
    if (productsData.length == 20) {
      return;
    }
    
    debugPrint('Fetching products');
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      debugPrint("in the try catch block");
      final http.Response response = await http
          .get(Uri.parse("https://fakestoreapi.com/products"))
          .timeout(Duration(seconds: 7));

      if (response.statusCode == 200) {
        _errorMessage = null;
        debugPrint('Products fetched');
        _addProducts(productsFromJson(response.body));
      } else {
        _errorMessage =
            "Fetching products failed with status code: ${response.statusCode}";
      }
    } on SocketException {
      _errorMessage = 'No Internet connection. Please connect and try again.';
    } on TimeoutException {
      _errorMessage = 'The connection has timed out. Please try again.';
    } catch (e) {
      _errorMessage = 'Fetching products failed: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _addProducts(List<Product> products) {
    for (final product in products) {
      productsData.add(product);
    }
  }

  bool get isLoading => _isLoading;
  String? get errorMessage {
    String? error = _errorMessage;
    return error;
  }
}
