class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    List<String> shuffledList = List<String>.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
