import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibe_chat/ui/authentication/screens/signup_screen.dart';

final lightTheme = ThemeData.light(
  useMaterial3: true,
).copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 0, 95, 227),
  ),
  textTheme: GoogleFonts.poppinsTextTheme(),
);

final darkTheme = ThemeData.light(
  useMaterial3: true,
).copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 0, 58, 138),
  ),
  textTheme: GoogleFonts.poppinsTextTheme(),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const VibeChat());
}

class VibeChat extends StatelessWidget {
  const VibeChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VibeChat',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const SignupScreen(),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Authentication Wrapper'),
      ),
    );
  }
}
