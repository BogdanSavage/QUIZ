class QuizQuestion {
  // Fonction Constructeur pour réutiliser cette classe
  const QuizQuestion ( this.text , this.answers ) ;
  final String text ;
  final List <String> answers ;

  List <String> get shuffledAnswers {
    final shuffleList = List.of (answers)  ;   //  1. Créer une copie des réponses
    shuffleList.shuffle()   ;                           //  2. Mélanger les réponses
    return shuffleList ;                                //  3. Retourner les réponses
  }
}