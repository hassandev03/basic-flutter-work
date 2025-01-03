import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app/providers/navigation_bar_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  final NavigationBarProvider widgetChanger;
  const CustomNavigationBar({super.key, required this.widgetChanger});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    print("Building CustomNavigationBar");
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        elevation: 5,
        backgroundColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        height: screenHeight * 0.075,
        labelTextStyle: WidgetStateProperty.resolveWith(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return TextStyle(
                fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primaryContainer,
                height: 0.9,
              );
            }
            return TextStyle(
              fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.surfaceBright,
              height: 0.9,
            );
          },
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (Set<WidgetState> states) {
             if (states.contains(WidgetState.selected)) {
              return IconThemeData(
                size: 28,
                color:Theme.of(context).colorScheme.primaryContainer,
              );
            }
            return IconThemeData(
              size: 28,
              color: Theme.of(context).colorScheme.surfaceBright,
            );
          },
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: NavigationBar(
          selectedIndex: widgetChanger.selectedWidgetIndex,
          animationDuration: const Duration(milliseconds: 800),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_outline),
              selectedIcon: Icon(Icons.favorite),
              label: "Favorites",
            ),
          ],
          onDestinationSelected: (int index) {
            HapticFeedback.lightImpact();
            widgetChanger.selectedWidgetIndex = index;
          },
        ),
      ),
    );
  }
}
