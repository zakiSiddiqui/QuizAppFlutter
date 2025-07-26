import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.btnText, this.onTap, {super.key});

  final String btnText;
  final void Function() onTap;

  @override
  Widget build(Object context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        backgroundColor: const Color.fromARGB(255, 38, 0, 108),
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      ),
      onPressed: onTap,
      child: Text(btnText, textAlign: TextAlign.center),
    );
  }
}
