class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers); //List 복사
    shuffledList.shuffle(); //List 섞기
    return shuffledList;
  }
}
