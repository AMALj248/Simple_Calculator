//importing material package
import 'package:flutter/material.dart';

//importing the buttons dart file
import 'package:simple_calculator/buttons.dart';

//importing the math library
import 'package:math_expressions/math_expressions.dart';

//the main function for the app
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

//Defining the Home Page Class
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//Creating the Home Page State Class

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';



  // Defining an iterable buttons layout
  final List<String> buttons = [
    'C',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'Ans',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: <Widget>[

          // The Top Screen
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:<Widget>[
                  SizedBox(height: 50,),
                  Container(
                    padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(userQuestion , style: TextStyle(fontSize: 20),),),
                  Container(
                    padding: EdgeInsets.all(20),
                      alignment : Alignment.centerRight,
                      child: Text(userAnswer , style: TextStyle(fontSize: 20),),)
                ]
                ,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {

                      //if statement for Clear and Del modification

                      //Clear Button
                      if (index == 0) {
                        return MyButton(
                          buttonTapped: (){
                            setState(() {
                              userQuestion ='';
                            });
                          } ,
                          buttonText: buttons[index],
                          color: Colors.green,
                          textcolor: Colors.white,
                        );
                      }

                      //Del Button
                      else if (index == 1) {
                        return MyButton(
                          buttonTapped: (){
                            setState(() {
                              userQuestion = userQuestion.substring(0,(userQuestion.length)-1);
                            });

                          },
                          buttonText: buttons[index],
                          color: Colors.redAccent,
                          textcolor: Colors.white,
                        );
                      }

                      //Equal to button
                      else if (index == (buttons.length-1) || index == (buttons.length-2)) {
                        return MyButton(
                          buttonTapped: (){
                            setState(() {
                             equalPressed();
                            });

                          },
                          buttonText: buttons[index],
                          color: Colors.redAccent,
                          textcolor: Colors.white,
                        );
                      }

                      //Rest of the Buttons
                      else {


                        return MyButton(
                          buttonTapped: (){
                            setState(() {
                              userQuestion+=buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.deepPurple
                              : Colors.deepPurple[50],
                          textcolor: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.deepPurple,
                        );
                      }
                    })),
          ),
        ],
      ),
    );
  }

  //Creating a method for diff operator button identification
  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

//Creating a method for equal to button calculation operation
 void equalPressed(){
   String finalQuestion = userQuestion;
   finalQuestion = finalQuestion.replaceAll('x', '*');

   Parser p = Parser();
   Expression exp = p.parse(finalQuestion);
   ContextModel cm = ContextModel();
   double eval = exp.evaluate(EvaluationType.REAL , cm);
   userAnswer = eval.toString();


}

}


