import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
    this.isAnswerCorrect, {
    super.key,
    required this.text,
  });

  final bool isAnswerCorrect;
  final String text;

  @override
  Widget build(BuildContext context) {
    var identifierColor =
        isAnswerCorrect
            ? Colors.lightBlueAccent
            : const Color.fromARGB(255, 233, 30, 220);
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(shape: BoxShape.circle, color: identifierColor),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
      ),
    );
  }
}
