import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/favorites_provider.dart';
import 'package:shopping_app/widgets/favorites/favorites_list.dart';

class FavoritesScreen extends StatelessWidget {
  static const String routeName = "/favorites";
  static const String title = "Favorites";
  const FavoritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    debugPrint("Building FavoritesScreen");
    return favoritesProvider.isEmpty
        ? Center(
            child: Text(
              "No favorite products! Start adding some.",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
              textAlign: TextAlign.center,
            ),
          )
        : const FavoritesList();
  }
}
