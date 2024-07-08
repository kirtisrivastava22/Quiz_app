class QuizQuestions{
  const QuizQuestions(this.ques,this.answers);

  final String ques;
  final List<String> answers;
  List<String> get shuffledAns{
    final shuffledList=List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}