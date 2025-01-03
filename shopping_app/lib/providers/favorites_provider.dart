import 'package:flutter/material.dart';
import 'package:shopping_app/data/products_data.dart';
import 'package:shopping_app/models/product.dart';

class FavoritesProvider extends ChangeNotifier {
  
  bool isFavorited(Product product) {
    return favoritedItems.contains(product);
  }

  void addToFavorites(Product product) {
    favoritedItems.add(product);
    notifyListeners();
  }

  void removeFromFavorites(Product product) {
    favoritedItems.remove(product);
    notifyListeners();
  }

  bool get isEmpty => favoritedItems.isEmpty;
}
