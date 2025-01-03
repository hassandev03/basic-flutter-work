import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/products_provider.dart';
import 'package:shopping_app/widgets/product/product_grid.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";
  static const String title = "EzzyShop";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final productsProvider = Provider.of<ProductsProvider>(context);
    return RefreshIndicator(
      onRefresh: () async {
        await productsProvider.fetchProducts();
      },
      child: productsProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : productsProvider.errorMessage == null
              ? ProductGrid()
              : SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    height: screenHeight - (screenHeight / 3.0),
                    width: screenWidth,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 80,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          "Oops! Failed to fetch products.",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: screenHeight * 0.006),
                        Text(
                          "Pull down from the top to try again!",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
