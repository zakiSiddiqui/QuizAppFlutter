import 'package:adv_basics/widgets/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen(this.chooseAnswer, {super.key});

  final void Function(String answer) chooseAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  var currentQuestionIndex = 0;
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 233, 128, 251),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            ...currentQuestion.getShuffleAnswers().map((answer) {
              return AnswerButton(answer, () {
                onTap(answer);
              });
            }),
          ],
        ),
      ),
    );
  }

  void onTap(String answer) {
    setState(() {
      widget.chooseAnswer(answer);
      currentQuestionIndex++;
      print(currentQuestionIndex.toString());
    });
  }
}
