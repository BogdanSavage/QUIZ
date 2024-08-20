import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/models/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

   final List<String> chosenAnswers;
  final void Function() onRestart;
   List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {

          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }
    return summary;   }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length  ;
    final numCorrectQuestions = summaryData.where ( (data) =>
      data['user_answer' ] == data ['correct_answer']  ) .length  ;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(' Vous avez $numCorrectQuestions bonnes réponses sur  $numTotalQuestions questions !' , style:  const TextStyle( color: Colors.white , fontSize: 22 ),),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary( summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon (
              onPressed:   onRestart  ,
              style: TextButton.styleFrom(
                foregroundColor:Colors.yellowAccent , ),
                icon: const Icon(Icons.refresh),
                label: const Text(' Recommencer ' , style: TextStyle(fontSize: 30 ,),
                 ),),
            ] ,
        ),
      ),
    );
  }
}
