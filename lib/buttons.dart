import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
//defining the constant variables for buttons
  final color;
  final textcolor;
  final String buttonText;
  final buttonTapped;

  //Construcutor for the MyButton Class
  MyButton({this.color, this.textcolor, this.buttonText , this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    //defining the buttons looks
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap:buttonTapped ,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textcolor , fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
