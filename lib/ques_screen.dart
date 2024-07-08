import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuesScreen extends StatefulWidget {
  const QuesScreen({
    super.key,
    required this.onSelectAns,
  });
  final void Function(String answer) onSelectAns;

  @override
  State<QuesScreen> createState() {
    return _QuesScreenState();
  }
}

class _QuesScreenState extends State<QuesScreen> {
  var currQuesIndex = 0;

  void answerQuestionchange(String selectedAns) {
    widget.onSelectAns(selectedAns);
    setState(() {
      currQuesIndex += 1;
    });
  }

  @override
  Widget build(context) {
    var currQues = questions[currQuesIndex];

    return SizedBox(
      width: double.infinity, //use as much space as u can
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currQues.ques,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currQues.shuffledAns.map((item) {
              return AnswerButton(
                  ansNo: item,
                  onTap: () {
                    answerQuestionchange(item);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
