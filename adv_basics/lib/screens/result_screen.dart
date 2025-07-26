import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/widgets/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.choosenAnswers, this.switchScreen, {super.key});

  final void Function(String screenId) switchScreen;
  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'choosen_answer': choosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    print("from result screen");
    print(choosenAnswers);
    print(getSummaryData());

    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctlyAnswered =
        summaryData.where((data) {
          return data['correct_answer'] == data['choosen_answer'];
        }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You answered $correctlyAnswered out of $totalQuestions questions correctly",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromARGB(128, 255, 255, 255),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            QuestionsSummary(summaryData),
            SizedBox(height: 20),
            TextButton.icon(
              onPressed: () {
                switchScreen('start-screen');
              },
              label: Text(
                "restart quiz",
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(Icons.restart_alt_rounded, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
