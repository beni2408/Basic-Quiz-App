import 'package:flutter/material.dart';
import 'package:quizapp_udemy/answer_button.dart';

import 'package:quizapp_udemy/data/questions.dart';
//import 'package:quizapp_udemy/models/quiz_question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key, required this.onSelectAnswer,});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen>{
  var currentQuestionIndex = 0;

  void answeredQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }


  @override
  Widget build(context){

    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,

      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
              Text(
               currentQuestion.text,
              style: GoogleFonts.montserrat(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              ),


              const SizedBox(height: 30),
              ...currentQuestion.shffuledAnswers.map((answer){
                return AnswerButton(
                answerText: answer,
                    onTap: (){
                      answeredQuestion(answer);
                    },

                );
              })


             /*AnswerButton(
                  answerText: currentQuestion.answers[0],
                  onTap: () {}
              ),
            AnswerButton(
                answerText: currentQuestion.answers[1],
                onTap: (){},
            ),
            AnswerButton(
                answerText: currentQuestion.answers[2] ,
                onTap: (){},
            ),
            AnswerButton(
              answerText: currentQuestion.answers[3] ,
              onTap: (){},*/
           //),
          ],
        ),
      ),
    );
  }

}