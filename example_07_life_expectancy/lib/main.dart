import 'package:flutter/material.dart';

import './inputPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.blueAccent[200],
          primaryColor: Colors.blueAccent[200]),
    );
  }
}
