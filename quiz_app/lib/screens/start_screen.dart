import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  final void Function(String) startQuiz;
  const StartScreen(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          height: 300,
          color: Colors.white.withOpacity(0.75),
        ),
        const SizedBox(height: 45),
        Text(
          "Learn Flutter the fun way!",
          style: GoogleFonts.montserrat(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 50),
        OutlinedButton.icon(
          onPressed: () => startQuiz("questions-screen"),
          style: OutlinedButton.styleFrom(
            elevation: 3,
            backgroundColor: const Color.fromARGB(172, 1, 116, 179),
            side: const BorderSide(
              color: Color.fromARGB(255, 0, 116, 178),
              width: 1.15,
            ),
          ),
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Color.fromARGB(200, 255, 255, 255),
          ),
          label: Text(
            "Start Quiz",
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 225, 246, 254),
            ),
          ),
        ),
      ],
    );
  }
}
