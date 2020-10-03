import 'package:example_06_information_competition/models/question.dart';

class QuestionDataProvider {
  List<Question> questions = [
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
}
