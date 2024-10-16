import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz,{super.key});

  final void Function ()startQuiz;

  @override
  Widget build(context){
    return Center(
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/image/quiz-logo.png',
                width: 300,
                color: const Color.fromARGB(150, 255, 255, 255),
            ),
      const SizedBox(height: 30,),
      const Text('Learn Flutter in a fun way',
        style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 237, 223, 252),
        ),
      ),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              icon: const Icon(Icons.arrow_right_alt),
                onPressed: startQuiz,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white
                ),
                label:  const Text('Start Quiz',
                  ))
          ],
        )
    );
  }

}