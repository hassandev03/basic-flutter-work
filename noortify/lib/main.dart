import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noortify/modules/intro/views/intro_screen.dart';
import 'package:noortify/modules/navigation/views/navigation_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Noortify());
}

class Noortify extends StatelessWidget {
  const Noortify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noortify',
      home: NavigationScreen(),
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 33, 29, 29),
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: const Color.fromARGB(255, 33, 29, 29),
        ),
        textTheme: GoogleFonts.manropeTextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: GoogleFonts.manrope(),
            backgroundColor: const Color.fromARGB(255, 255, 153, 54),
            foregroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Authentication Wrapper',
        ),
      ),
    );
  }
}
