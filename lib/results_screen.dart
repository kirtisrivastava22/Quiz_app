
import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';

import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {

  const ResultsScreen({super.key ,required this.selectedAnswers, required this.restartQuiz});
  final List <String> selectedAnswers;
  final void Function() restartQuiz;
  List <Map<String ,Object>> getSummaryData(){
    final List <Map<String ,Object>> summary=[];
    for (var i=0; i<selectedAnswers.length;i++) {
      summary.add({
        'question_index':i,
        'question':questions[i].ques,
        'correct_answer':questions[i].answers[0].toString(),
        'user_answer':selectedAnswers[i].toString()
      }
      );
    
    }
    return summary;
  }


  @override
  Widget build(context) {

    final summaryData=getSummaryData();
    final numTotQues=questions.length;
    final numCorrQues=summaryData
    .where( 
      (data) =>
      data['correct_answer']==data['user_answer']
      )    
    .length;

    return SizedBox(
      width: double.infinity, //use as much space as u can
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You Answered $numCorrQues out of $numTotQues questions correctly!' ,style:const TextStyle(color: Color.fromARGB(255, 252, 252, 252), fontSize: 18),),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData:getSummaryData()),
            const SizedBox(height: 30),

            TextButton.icon(
              onPressed: () {
                 restartQuiz();
                 },
                 icon:const Icon(Icons.refresh),
              label: const Text('Restart Quiz' ,style:TextStyle(color:Colors.blue,fontSize: 16)))
          ],
        ),
      ),
    );
  }
}
