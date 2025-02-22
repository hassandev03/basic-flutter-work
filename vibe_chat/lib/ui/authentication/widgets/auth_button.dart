import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onTapped;
  final String text;
  const AuthButton({
    super.key,
    required this.onTapped,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return ElevatedButton(
      onPressed: onTapped,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        foregroundColor: Theme.of(context).colorScheme.primary,
        textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w900,
            ),
        visualDensity: VisualDensity.compact,
        minimumSize: Size(
          screenWidth,
          screenWidth * 0.125,
        ),
      ),
      child: Text(text),
    );
  }
}
