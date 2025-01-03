import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/providers/cart_items_provider.dart';
import 'package:shopping_app/widgets/cart/quantity_button.dart';

class CartListItem extends StatelessWidget {
  final Product product;
  const CartListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    print("Building ListProductItem");
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListTile(
              title: Text(
                product.title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
              style: ListTileStyle.list,
              leading: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.imageUrl,
                  height: screenHeight * 0.1,
                ),
              ),
              subtitle: Text(
                "Rs.${product.price.toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.01),
              SizedBox(
                height: screenHeight * 0.05,
                child: QuantityButton(
                  product: product,
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  Provider.of<CartItemsProvider>(context, listen: false)
                      .removeFromCart(product);
                },
                icon: const Icon(
                  Icons.remove_circle_outline,
                  size: 16,
                ),
                label: Text(
                  "Remove",
                  style: const TextStyle().copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  minimumSize: Size(64, 26),
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
