
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List <Map<String ,Object>> summaryData;//list of map objects
  @override  
  Widget build(context){

    List <Color> getColorsOfQues(){
      final List <Color> colorOfQues=[];
      for(int i=0;i<summaryData.length;i++){
          if(summaryData[i]['correct_answer']==summaryData[i]['user_answer']) {
          colorOfQues.add(Colors.green);
        }
        else {
        colorOfQues.add(Colors.red);
        }
      }
      return colorOfQues;
      
    };


    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(children: summaryData.map((data) {
          return Row(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
            Container(
              width: 25,
              height: 25,
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: getColorsOfQues()[data['question_index'] as int ]),

              child: Text(((data['question_index'] as int) + 1).toString(),
              style:const TextStyle(color:Colors.black ,fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(data['question'] as String,style: GoogleFonts.aBeeZee(color: const Color.fromARGB(255, 10, 10, 10), fontSize: 14),),
                const SizedBox(height:5),
                Text(data['user_answer'] as String ,style: GoogleFonts.aBeeZee(color: Color.fromARGB(255, 50, 12, 176), fontSize: 14),),
                Text(data['correct_answer'] as String ,style: GoogleFonts.aBeeZee(color: Color.fromARGB(255, 4, 89, 52), fontSize: 14),),
                const SizedBox(height:30),
              ],
              ),
            ),
          ],);
        }).toList(),
        ),
      ),
    ); // column wants alist of widgets
  }
}