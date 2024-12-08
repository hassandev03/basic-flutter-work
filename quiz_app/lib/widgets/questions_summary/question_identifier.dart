import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIdentifier extends StatelessWidget {
  final int questionNumber;
  final bool isCorrect;

  const QuestionIdentifier({
    required this.questionNumber,
    required this.isCorrect,
    super.key,
  });

  @override
  Widget build(context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrect
            ? const Color.fromARGB(255, 125, 223, 143)
            : const Color.fromARGB(255, 226, 129, 129),
        shape: BoxShape.circle,
      ),
      child: Text(
        questionNumber.toString(),
        style: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isCorrect
              ? const Color.fromARGB(255, 46, 87, 54)
              : const Color.fromARGB(255, 79, 42, 42),
        ),
      ),
    );
  }
}
