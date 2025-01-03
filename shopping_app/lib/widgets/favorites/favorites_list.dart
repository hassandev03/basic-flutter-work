import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/data/products_data.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/providers/favorites_provider.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider =
        Provider.of<FavoritesProvider>(context, listen: false);
    return ListView.builder(
      itemCount: favoritedItems.length,
      itemBuilder: (context, index) {
        print("Building FavoritesList Builder");
        Product product = favoritedItems[index];
        return Dismissible(
          key: ValueKey(product),
          background: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color:
                  Theme.of(context).colorScheme.error.withValues(alpha: 0.66),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
          onDismissed: (direction) {
            favoritesProvider.removeFromFavorites(product);
          },
          child: Card(
            child: ListTile(
              visualDensity: VisualDensity.compact,
              title: Text(
                product.title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
              style: ListTileStyle.list,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(product.imageUrl, width: 60),
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
        );
      },
    );
  }
}
