import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/providers/cart_items_provider.dart';

class QuantityButton extends StatelessWidget {
  final Product product;

  const QuantityButton({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    print("Building QuantityButton");
    final cartItemsProvider = Provider.of<CartItemsProvider>(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          iconSize: 20,
          color: Colors.black.withValues(alpha: 0.60),
          onPressed: () {
            cartItemsProvider.decreaseQuantity(product);
          },
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact
          ),
        ),
        Text(
          cartItemsProvider.getProductQuantity(product).toString(),
          style: const TextStyle()
              .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        IconButton(
          alignment: Alignment.center,
          icon: const Icon(Icons.add),
          iconSize: 20,
          color: Colors.black.withValues(alpha: 0.60),
          onPressed: () {
            cartItemsProvider.increaseQuantity(product);
          },
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact
          ),
        ),
      ],
    );
  }
}
