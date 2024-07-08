import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(  this.startQuiz,{super.key});

  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Opacity(
        //   opacity: 0.2,
        //     child: Image.asset(
        //   'assets/images/quiz-logo.png',
        //   width: 250,
        //   color:Colors.red,
        // ),
        // ),
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 250,
          color:Color.fromARGB(239, 248, 245, 249),
        ),
        const SizedBox(height: 50),
        Text(
          'Wanna play a Quiz game?',
          style:GoogleFonts.lato(
            color: const Color.fromARGB(244, 255, 255, 255),
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              iconColor: Colors.deepPurple,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: () {
              startQuiz();
            },
            label: Text('Start Quiz',
            style:GoogleFonts.questrial(
            color: const Color.fromARGB(244, 54, 5, 103),
            fontSize: 24,
          )))
      ],
    ));
  }
}
