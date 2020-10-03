import 'package:example_06_information_competition/models/question.dart';

/// Bu sınıf bünyesinde dışarıya soru verilerini sağlama ve soru geçişi işlemleri soyutlanmış oldu.
class QuestionDataProvider {
  // Baştan itibaren kaçıncı soruda olunduğunu tuta değişken
  int _questionIndex = 0;

  List<Question> _questions = [
    Question(
        questionString: 'Titanic gelmiş geçmiş en büyük gemidir',
        questionResult: false),
    Question(
        questionString: 'Dünyadaki tavuk sayısı insan sayısından fazladır',
        questionResult: true),
    Question(
        questionString: 'Kelebeklerin ömrü bir gündür', questionResult: false),
    Question(questionString: 'Dünya düzdür', questionResult: false),
    Question(
        questionString: 'Kaju fıstığı aslında bir meyvenin sapıdır',
        questionResult: true),
    Question(
        questionString: 'Fatih Sultan Mehmet hiç patates yememiştir',
        questionResult: true),
    Question(
        questionString: 'Fransızlar 80 demek için, 4 - 20 der',
        questionResult: true)
  ];

  String getCurrentQuestionString() {
    return _questions[_questionIndex].questionString;
  }

  bool getCurrentQuestionResult() {
    return _questions[_questionIndex].questionResult;
  }

  void setAnotherQuestion() {
    _questionIndex++;

    if (_questionIndex >= _questions.length) {
      _questionIndex = 0;
    }
  }
}
