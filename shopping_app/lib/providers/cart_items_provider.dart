import 'package:flutter/material.dart';
import 'package:shopping_app/data/products_data.dart';
import 'package:shopping_app/models/product.dart';

class CartItemsProvider extends ChangeNotifier {
  bool isInCart(Product product) {
    return cartItems.containsKey(product);
  }

  void addToCart(Product product) {
    cartItems[product] = (cartItems[product] ?? 0) + 1;
    notifyListeners();
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
    notifyListeners();
  }

  void increaseQuantity(Product product) {
    cartItems[product] = cartItems[product]! + 1;
    notifyListeners();
  }

  void decreaseQuantity(Product product) {
    if (cartItems[product]! > 1) {
      cartItems[product] = cartItems[product]! - 1;
    }
    notifyListeners();
  }

  int getProductQuantity(Product product) {
    return cartItems[product] ?? 0;
  }

  Product getProductByIndex(int index) {
    return cartItems.keys.elementAt(index);
  }

  int get cartQuantity {
    int sum = 0;
    for (final int _ in cartItems.values) {
      sum++;
    }
    return sum;
  }

  int get cartItemCount => cartItems.length;
  bool get isEmpty => cartItems.isEmpty;

  double get totalCartAmount {
    double total = 0;
    cartItems.forEach(
      (product, quantity) {
        total += product.price * quantity;
      },
    );
    return total;
  }
}
