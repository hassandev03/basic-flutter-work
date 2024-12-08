import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/widgets/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  final Map<String, Object> summaryItem;

  const SummaryItem(this.summaryItem, {super.key});

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            questionNumber: summaryItem["question_number"] as int,
            isCorrect:
                (summaryItem["user_answer"] == summaryItem["correct_answer"]),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  summaryItem["question"] as String,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.5,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  summaryItem["user_answer"] as String,
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 199, 241, 255),
                  ),
                ),
                Text(
                  summaryItem["correct_answer"] as String,
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 132, 254, 154),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
