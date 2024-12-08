import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.text, required this.onTap});

  final String text;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 0, 94, 162),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        elevation: 3,
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
