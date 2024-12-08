import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = "start-screen";
  List<String> answers = [];

  void changeScreen(String screenName) {
    if (screenName == "start-screen") {
      answers = [];
    }
    setState(() {
      activeScreen = screenName;
    });
  }

  void selectAnswer(String chosenAnswer) {
    answers.add(chosenAnswer);

    if (answers.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color.fromARGB(255, 0, 98, 218),
                Color.fromARGB(255, 0, 142, 230),
                Color.fromARGB(255, 81, 176, 253),
              ],
            ),
          ),
          alignment: Alignment.center,
          child: activeScreen == "start-screen"
              ? StartScreen(changeScreen)
              : activeScreen == "questions-screen"
                  ? QuestionsScreen(onSelectAnswer: selectAnswer)
                  : ResultScreen(
                      chosenAnswers: answers, onTapRestart: changeScreen),
        ),
      ),
    );
  }
}
