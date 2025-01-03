import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_items_provider.dart';
import 'package:shopping_app/providers/navigation_bar_provider.dart';
import 'package:shopping_app/providers/products_provider.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/screens/favorites_screen.dart';
import 'package:shopping_app/screens/home_screen.dart';
import 'package:shopping_app/widgets/custom_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "/main";
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Map<int, Widget> screens = const {
    0: HomeScreen(),
    1: FavoritesScreen(),
  };

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ProductsProvider>(context, listen: false).fetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    final NavigationBarProvider navigationProvider =
        Provider.of<NavigationBarProvider>(context);
    final bool isHomeScreen = navigationProvider.selectedWidgetIndex == 0;

    print("Building MainScreen");
    return Scaffold(
      appBar: AppBar(
        // Show title based on the selected screen
        title: Text(
          isHomeScreen ? HomeScreen.title : FavoritesScreen.title,
        ),
        actions: [
          // Show cart icon only on the home screen
          if (isHomeScreen)
            IconButton(
              padding: const EdgeInsets.only(right: 16),
              icon: Consumer<CartItemsProvider>(
                builder: (context, provider, child) => Badge.count(
                  count: provider.cartQuantity,
                  child: const Icon(Icons.shopping_cart_rounded),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            )
        ],
      ),
      body: screens[navigationProvider.selectedWidgetIndex]!,
      bottomNavigationBar: Consumer<NavigationBarProvider>(
        builder: (context, provider, child) => CustomNavigationBar(
          widgetChanger: provider,
        ),
      ),
    );
  }
}
