import 'package:flutter/cupertino.dart';

/// Sınıf tanımlaması
class Question {
  String questionString;
  bool questionResult;

  // Kurucu tanımı, field'lara değer ataması zorunlu değil.
  // Question({this.questionString, this.questionResult});

  // Kurucu tanımı, field'lara değer ataması zorunlu değil.
  Question({@required this.questionString, @required this.questionResult});
}
