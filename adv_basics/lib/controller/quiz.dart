import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/screens/quiz_screen.dart';
import 'package:adv_basics/screens/result_screen.dart';
import 'package:adv_basics/screens/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> choosenAnswers = [];
  var activeScreen = 'start-screen';

  void chooseAnswer(String answer) {
    choosenAnswers.add(answer);
    if (choosenAnswers.length == questions.length) {
      setState(() {
        //choosenAnswers.clear();
        activeScreen = 'result-screen';
      });
    }
    print(choosenAnswers);
  }
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen(String screenId) {
    setState(() {
      // activeScreen = const QuizScreen();
      activeScreen = screenId;
      if (activeScreen == 'start-screen') {
        choosenAnswers.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'quiz-screen') {
      screenWidget = QuizScreen(chooseAnswer);
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(choosenAnswers, switchScreen);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 41, 13, 89),
                Color.fromARGB(255, 115, 71, 190),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
