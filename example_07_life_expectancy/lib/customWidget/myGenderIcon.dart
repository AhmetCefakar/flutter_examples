import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class MyGenderIcon extends StatelessWidget {
  final String text;
  final IconData iconData;

  MyGenderIcon({this.text, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      // 'mainAxisAlignment' le dikeyde ortalma yapılmaktadır.
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 50.0,
          color: Colors.black54,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          text,
          style: my20SizeBoldBlackTextStyle,
        )
      ],
    );
  }
}
