import 'package:example_06_information_competition/dataProviders/questionDataProvider.dart';
import 'package:flutter/material.dart';

// Custom imports
import 'customDeclarations/constants.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  // Doğru yanlış iconların listesinin tutulduğu liste
  List<Widget> _answerResults = [];

  // Soru verisini barındıran veri sağlayıcı sınıfın nesnesinin üretilmesi
  QuestionDataProvider _questionDataProvider = QuestionDataProvider();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                _questionDataProvider.getCurrentQuestionString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        // 'Wrap' widget'ı ile taşma oluştuğunda taşma diğer satır yada colona iletilir.
        Wrap(
          children: _answerResults,
          direction: Axis
              .horizontal, // Taşmanın yatayda yapılmasını sağlar, varsayılandır.
          spacing:
              3.0, // 'Wrap'in çocuklarının yataydaki ara boşluklarını belirtir.
          runSpacing:
              3.0, // 'Wrap'in çocuklarının dikeyde ara boşluklarını belirtir.
          alignment: WrapAlignment
              .spaceEvenly, // Çocukların nasıl sıralanacağını belirler.
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.red[400],
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                      onPressed: () {
                        _clickAnsver(false);
                        // setState(() {
                        //   bool trueAnswer =
                        //       _questionDataProvider.getCurrentQuestionResult();

                        //   if (trueAnswer == false) {
                        //     _answerResults.add(constTrueAnswer);
                        //   } else {
                        //     _answerResults.add(constFalseAnswer);
                        //   }

                        //   _questionDataProvider.setAnotherQuestion();
                        // });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.green[400],
                      child: Icon(Icons.thumb_up, size: 30.0),
                      onPressed: () {
                        _clickAnsver(true);
                        // setState(() {
                        //   bool trueAnswer =
                        //       _questionDataProvider.getCurrentQuestionResult();

                        //   trueAnswer == true
                        //       ? _answerResults.add(constTrueAnswer)
                        //       : _answerResults.add(constFalseAnswer);

                        //   _questionDataProvider.setAnotherQuestion();
                        // });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  /// Sorulara verilen cevaba göre doğru/yanlış iconlarını ekrana basma işi her iki buton için büyü
  /// ölçüde aynı olduğu için tek bir metoda alındı.
  void _clickAnsver(bool querySuccessStatu) {
    if (_questionDataProvider.isLastQuestion()) {
      // Tüm soruların bitiminde iletişim dialoğu gösteriliyor.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Soruların Hepsini Tamamladınız"),
            // content: new Text(""),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Tekrar Başla"),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop();
                    _questionDataProvider.clearState();
                    _answerResults = [];
                  });
                },
              ),
              new FlatButton(
                child: new Text("Devamet"),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop();
                    _questionDataProvider.setAnotherQuestion();
                  });
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        bool trueAnswer = _questionDataProvider.getCurrentQuestionResult();

        trueAnswer == querySuccessStatu
            ? _answerResults.add(constTrueAnswer)
            : _answerResults.add(constFalseAnswer);

        _questionDataProvider.setAnotherQuestion();
      });
    }
  }
}
