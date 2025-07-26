import 'package:adv_basics/widgets/question_identifier.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((data) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuestionIdentifier(
                      data['correct_answer'] == data['choosen_answer'],
                      text: ((data['question_index'] as int) + 1).toString(),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: TextStyle(
                              color: const Color.fromARGB(188, 255, 255, 255),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            data['correct_answer'] as String,
                            style: TextStyle(
                              color: const Color.fromARGB(100, 221, 104, 242),
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            data['choosen_answer'] as String,
                            style: TextStyle(
                              color: const Color.fromARGB(179, 72, 191, 245),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
