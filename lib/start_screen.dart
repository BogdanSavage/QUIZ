import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen( this.startQuiz , {super.key});
  final void Function () startQuiz ;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png', width: 300,
              color: const Color.fromARGB(150 , 255, 255, 255)),
          Opacity(
            opacity: 0.6,
            child: Image.asset( 'assets/images/quiz-logo.png', width: 300,   ), ),

          const SizedBox(height: 50),
          const Text (' Apprendre Flutter avec plaisir ',
            style: TextStyle(color: Color.fromARGB(255, 237, 223, 252),
              fontSize: 18,),
          ),
          const SizedBox(height: 15),
          OutlinedButton.icon(
            onPressed:  startQuiz ,
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle( fontSize: 18 )) ,
            icon: const Icon(Icons.radar) ,
            label: const Text('Démarrer le Quiz'),  ),
        ],
      ),
    );
  }
}
