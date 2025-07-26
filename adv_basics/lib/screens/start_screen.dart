import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function(String screenId) startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromARGB(60, 255, 255, 255),
          ),
          const SizedBox(height: 50),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.lato(
              fontSize: 24,
              color: const Color.fromARGB(255, 214, 123, 230),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              startQuiz('quiz-screen');
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.pressed)) {
                  return Colors.orange;
                } else if (states.contains(WidgetState.disabled)) {
                  return Colors.grey;
                }
                return Colors.white; // default
              }),
            ),
            icon: const Icon(Icons.arrow_right_alt, color: Colors.red),
            label: const Text(
              "Start Quiz",
              style: TextStyle(color: Colors.purple),
            ),
          ),
        ],
      ),
    );
  }
}
