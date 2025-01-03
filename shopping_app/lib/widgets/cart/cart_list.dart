import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_items_provider.dart';
import 'package:shopping_app/widgets/cart/cart_list_item.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    print("Building ProductList");
    return Consumer<CartItemsProvider>(
      builder: (context, cartItemsProvider, child) {
        print("Building ProductList Builder");
        return ListView.builder(
          itemCount: cartItemsProvider.cartItemCount,
          itemBuilder: (context, index) {
            return CartListItem(
              product: cartItemsProvider.getProductByIndex(index),
            );
          },
        );
      },
    );
  }
}
