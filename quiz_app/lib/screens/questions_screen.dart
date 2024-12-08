import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/widgets/answer_button.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:quiz_app/models/quiz_question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void changeQuestion(String chosenAnswer) {
    widget.onSelectAnswer(chosenAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuestion currentQuestion = questions[currentQuestionIndex];
    return Container(
      margin: const EdgeInsets.all(40),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            currentQuestion.question,
            style: GoogleFonts.montserrat(
              color: const Color.fromARGB(255, 196, 239, 255),
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ...currentQuestion.getShuffledAnswers().map(
            (answer) {
              return Container(
                margin: const EdgeInsets.only(top: 7.5, bottom: 7.5),
                child: AnswerButton(
                  text: answer,
                  onTap: () => changeQuestion(answer),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
