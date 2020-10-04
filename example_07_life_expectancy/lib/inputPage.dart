import 'package:example_07_life_expectancy/inums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'customWidget/CustomContainerWidget.dart';
import 'customWidget/myGenderIcon.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.female;
  double _cigaretteCount = 0;
  double _sporDayCount = 0;
  int heightValue = 170;
  int weightValue = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Dikeyde konumlama
        crossAxisAlignment: CrossAxisAlignment.stretch, // Yatay konumlama
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CustomContainerWidget(
                    child: buildRow(BodySizes.height, 'BOY', 170),
                  ),
                ),
                Expanded(
                  child: CustomContainerWidget(
                    child: buildRow(BodySizes.weight, 'KİLO', 70),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CustomContainerWidget(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Haftada Kaç Gün Spor yaparsan?',
                          style: my20SizeBoldBlackTextStyle,
                        ),
                        Text(
                          '${_sporDayCount.round()}',
                          style: my23SizeBoldBlueTextStyle,
                        ),
                        Slider(
                          value: _sporDayCount,
                          min: 0,
                          max: 7,
                          divisions: 7,
                          label: '${_sporDayCount.round()}',
                          onChanged: (double value) {
                            // Slider değeri değiştiğinde tetiklenen action
                            setState(() {
                              _sporDayCount = value;
                            });
                          },
                        )
                      ],
                    ),
                    // CustomSliderContainerWidget(
                    //   sliderChanged: (double value) {
                    //     // Slider değeri değiştiğinde tetiklenen action
                    //     setState(() {
                    //       _cigaretteCount = value;
                    //     });
                    //   },
                    //   sliderCountValue: 0,
                    //   sliderText: 'Haftada Kaç Gün Spor yaparsan?',
                    //   sliderMinValue: 0,
                    //   sliderMaxValue: 7,
                    //   sliderDivisionsValue: 7,
                    // ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CustomContainerWidget(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Kaç Gündür Tüttür içmisen?',
                          style: my20SizeBoldBlackTextStyle,
                        ),
                        Text(
                          '${_cigaretteCount.round()}',
                          style: my23SizeBoldBlueTextStyle,
                        ),
                        Slider(
                          value: _cigaretteCount,
                          min: 0,
                          max: 50,
                          // divisions: 50,
                          label: '${_cigaretteCount.round()}',
                          onChanged: (double value) {
                            // Slider değeri değiştiğinde tetiklenen action
                            setState(() {
                              _cigaretteCount = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  // CustomSliderContainerWidget(
                  //   sliderChanged: (double value) {
                  //     // Slider değeri değiştiğinde tetiklenen action
                  //     setState(() {
                  //       _cigaretteCount = value;
                  //     });
                  //   },
                  //   sliderCountValue: 0,
                  //   sliderText: 'Kaç Gündür Tüttür içmisen?',
                  //   sliderMinValue: 0,
                  //   sliderMaxValue: 50,
                  //   sliderDivisionsValue: 50,
                  // ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CustomContainerWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? Colors.white60
                        : Colors.white,
                    child: MyGenderIcon(
                      text: 'Kadın',
                      iconData: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: CustomContainerWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? Colors.white60
                        : Colors.white,
                    child: MyGenderIcon(
                      text: 'Erkek',
                      iconData: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// State verisinden dolayı 'Custom Widget' olarak tanımlanamayan ekran parçası sınıf içinde ayrı bir method olarak tanımlandı.
  /// Bu kötü bir kullanım!
  /// 'State Management' konusunu detaylamasına bil!
  Row buildRow(
    BodySizes bodySizes,
    String name,
    // int maxValueConstrain,
    // int minValueConstrain,
    int standartValue,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            name, //'BOY',
            style: my20SizeBoldBlackTextStyle,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            bodySizes == BodySizes.height ? '$heightValue' : '$weightValue',
            style: my23SizeBoldBlueTextStyle,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                onPressed: () {
                  // print('Pressed +');
                  setState(() {
                    if (bodySizes == BodySizes.height) {
                      heightValue++;

                      if (heightValue >= 250) {
                        heightValue = standartValue;
                      }
                    } else if (bodySizes == BodySizes.weight) {
                      weightValue++;

                      if (weightValue >= 1000) {
                        weightValue = standartValue;
                      }
                    }
                  });
                },
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 10.0,
                  color: Colors.black54,
                ),
                borderSide: BorderSide(
                  color: Colors.lightBlue,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                onPressed: () {
                  // print('Pressed -');
                  setState(() {
                    if (bodySizes == BodySizes.height) {
                      heightValue--;

                      if (heightValue <= 30) {
                        heightValue = standartValue;
                      }
                    } else if (bodySizes == BodySizes.weight) {
                      weightValue--;

                      if (weightValue <= 10) {
                        weightValue = standartValue;
                      }
                    }
                  });
                },
                child: Icon(
                  FontAwesomeIcons.minus,
                  size: 10.0,
                  color: Colors.black54,
                ),
                borderSide: BorderSide(
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
