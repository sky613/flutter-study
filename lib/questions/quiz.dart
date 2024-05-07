import 'package:first_app2/data/questions.dart';
import 'package:first_app2/questions/questions_screen.dart';
import 'package:first_app2/questions/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_app2/questions/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({
    super.key,
  });

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  // Widget? activeScreen; //null 이 될수 있다는
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers , onRestart : restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.blueGrey],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
