import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:quiz_app/widgets/questions_summary/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final void Function(String) onTapRestart;

  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.onTapRestart});

  List<Map<String, Object>> getQuestionsSummary() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          "question_number": i + 1,
          "question": questions[i].question,
          "correct_answer": questions[i].answers[0],
          "user_answer": chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final List<Map<String, Object>> summary = getQuestionsSummary();
    final int totalQuestions = summary.length;
    final int numCorrectAnswers = summary.where((e) {
      return e["user_answer"] == e["correct_answer"];
    }).length;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You answered $numCorrectAnswers out of $totalQuestions answers correctly",
            style: GoogleFonts.montserrat(
              color: const Color.fromARGB(255, 196, 239, 255),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          QuestionsSummary(getQuestionsSummary()),
          const SizedBox(height: 50),
          TextButton.icon(
            onPressed: () => onTapRestart("start-screen"),
            icon: const Icon(Icons.refresh),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(173, 0, 104, 160),
              textStyle: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600, fontSize: 16),
            ),
            label: const Text("Restart Quiz!"),
          ),
        ],
      ),
    );
  }
}
