import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp_udemy/data/questions.dart';
import 'package:quizapp_udemy/questions_summary.dart';
//import 'package:quizapp_udemy/quiz.dart';


class ResultsScreen extends StatelessWidget{
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });
final void Function() onRestart;
  final List<String> chosenAnswers;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      if (i < questions.length) {
        summary.add({
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        });
      }
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;


    return SizedBox(
        width: double.infinity,
        child: Container(
        margin: const EdgeInsets.all(40),
    child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
             children: [
                Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
                ),
                const SizedBox(
                  height: 30,
                ),
               QuestionsSummary(summaryData), // Call the function here

               const SizedBox(
                   height: 30,
                 ),
        TextButton.icon(
          icon: const Icon(Icons.refresh),
            onPressed:  onRestart,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text('Restart Quiz'),
        )
    ]),
    ),
    );

  }
}