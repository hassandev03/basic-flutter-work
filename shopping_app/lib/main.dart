import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_items_provider.dart';
import 'package:shopping_app/providers/favorites_provider.dart';
import 'package:shopping_app/providers/navigation_bar_provider.dart';
import 'package:shopping_app/providers/products_provider.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/screens/favorites_screen.dart';
import 'package:shopping_app/screens/home_screen.dart';
import 'package:shopping_app/screens/main_screen.dart';

final kLightColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF4B0082),
  brightness: Brightness.light,
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FavoritesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartItemsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NavigationBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          colorScheme: kLightColorScheme,
          textTheme: GoogleFonts.nunitoTextTheme(),
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kLightColorScheme.onPrimaryContainer,
            foregroundColor: kLightColorScheme.primaryContainer,
          ),
          cardTheme: CardTheme().copyWith(
            color: kLightColorScheme.secondaryContainer.withValues(alpha: 0.85),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            clipBehavior: Clip.hardEdge,
            elevation: 2,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              foregroundColor:
                  kLightColorScheme.onPrimaryContainer.withValues(alpha: 0.8),
            ),
          ),
        ),
        routes: {
          MainScreen.routeName: (ctx) => const MainScreen(),
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          FavoritesScreen.routeName: (ctx) => const FavoritesScreen(),
        },
        initialRoute: MainScreen.routeName,
      ),
    ),
  );
}
