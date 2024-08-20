import 'package:flutter/material.dart';
import 'questions_screen.dart';
import 'package:quiz/data/questions.dart';
import 'start_screen.dart';
import 'results_screen.dart';

class Quiz extends StatefulWidget { 
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
 List <String> selectedAnswers = [] ;
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer ( String answer ) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen' ;       }  ) ;         }       }
 void restartQuiz() {
   setState(() {
     selectedAnswers = [] ;
     activeScreen = 'questions-screen';
   });
 }

 @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer , );     }

    if (activeScreen == 'results-screen') {
      screenWidget =  ResultsScreen (
        chosenAnswers: selectedAnswers ,onRestart: restartQuiz,);     }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 45, 82, 229),
                Color.fromARGB(255, 231, 20, 53),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget   ,
        ),
      ),
    );
  }
}

class NAME extends StatelessWidget {
  const NAME({super.key});
  @override
  Widget build(context) {
    return const MaterialApp();
  }
}
