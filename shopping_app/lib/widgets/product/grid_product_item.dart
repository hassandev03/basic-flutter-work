import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/providers/cart_items_provider.dart';
import 'package:shopping_app/providers/favorites_provider.dart';
import 'package:shopping_app/widgets/product/image_widget.dart';

class GridProductItem extends StatelessWidget {
  final Product product;
  const GridProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    debugPrint("Building GridProductItem");
    final cartProvider = Provider.of<CartItemsProvider>(context, listen: false);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 7,
            child: SizedBox(
              height: screenHeight * 0.15,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ImageWidget(
                    height: screenHeight * 0.15,
                    width: screenWidth * 0.45,
                    imageUrl: product.imageUrl,
                  ),
                  Positioned(
                    right: 12,
                    top: 10,
                    child: SizedBox(
                      width: screenWidth * 0.075,
                      height: screenWidth * 0.075,
                      child: Consumer<FavoritesProvider>(
                        builder: (context, favoritesProvider, child) =>
                            IconButton(
                          icon: Icon(
                            favoritesProvider.isFavorited(product)
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                          ),
                          style: IconButton.styleFrom(
                            alignment: Alignment.center,
                            padding:
                                EdgeInsets.only(top: screenHeight * 0.013),
                            iconSize: screenWidth * 0.075,
                            visualDensity: VisualDensity.compact,
                            backgroundColor:
                                Theme.of(context).cardColor.withValues(
                                      alpha: 0.8,
                                    ),
                            foregroundColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: () {
                            favoritesProvider.isFavorited(product)
                                ? favoritesProvider.removeFromFavorites(product)
                                : favoritesProvider.addToFavorites(product);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                product.title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Rs.${product.price.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).hintColor,
                    height: 0.9,
                  ),
            ),
          ),
          ElevatedButton(
            onPressed: () => cartProvider.addToCart(product),
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  textStyle: WidgetStatePropertyAll(
                    Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w500, height: 0.6),
                  ),
                  minimumSize: WidgetStatePropertyAll(
                    Size(screenWidth * 0.275, screenHeight * 0.05),
                  ),
                ),
            child: Text(
              'Add to Cart',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
