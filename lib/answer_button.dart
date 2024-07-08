import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton({super.key,
  required this.ansNo,
  required this.onTap,
  });
  final String ansNo;
  final void Function() onTap;
  @override
 
    Widget build(context){
      return ElevatedButton(
                onPressed: onTap, 
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                  backgroundColor: const Color.fromARGB(255, 46, 2, 108),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.horizontal()),
                  ),
              child: Text(ansNo, textAlign: TextAlign.center,),
              );

  }
}