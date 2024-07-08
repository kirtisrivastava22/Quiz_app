

import 'package:flutter/material.dart';
import 'package:quiz_app/bg.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/ques_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
    State<Quiz> createState(){
      return _QuizState();
    }
    
}

class _QuizState extends State<Quiz>{
  List<String> selectedAns=[];
  Widget? activeScreen;
 
void initState(){
  activeScreen=StartScreen(switchScreen);
  super.initState();
}
  void switchScreen(){
    setState(() {
      activeScreen=QuesScreen(onSelectAns: choosenAns,);
    });
  }
 void restartScreen(){
  setState(() {
    selectedAns=[];
  activeScreen=QuesScreen(onSelectAns: choosenAns,);
  });
  
 }
 void choosenAns(String answer){
  selectedAns.add(answer);
  if(selectedAns.length==questions.length) {
    setState(() {
      activeScreen=ResultsScreen(selectedAnswers: selectedAns,restartQuiz: restartScreen,);
    });
  }
 }
 @override 
    Widget build(context){
      return MaterialApp(
      home:Scaffold(
        body:  Container(
  decoration : const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromARGB(96, 44, 3, 249),
        Color.fromARGB(66, 5, 43, 235),
        ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      
      ),
  ),
  child: activeScreen
),
      ),
    );
    }

}