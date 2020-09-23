// import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.brown[300],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.lime,
                  backgroundImage: AssetImage('assets/images/kahve.jpg'),
                ),
                Text(
                  "Gönül Kahvecisi",
                  style: TextStyle(
                    fontFamily: 'AlexBrush',
                    fontSize: 45,
                    color: Colors.brown[900],
                  ),
                ),
                Text(
                  "Bir Karış Ötende.",
                  style: TextStyle(
                    fontFamily: 'AlexBrush',
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                // 'Divider' widget'ını yatayda kapladığı alanı düzenlemek için onu 'Container' widget'ı ile sarmalamak gerekir.
                // 'Divider' widget'ı yatay çizgi eklemek için kullanılır.
                Container(
                  // margin: EdgeInsets.symmetric(
                  //   horizontal: 30.0,
                  // ),
                  width: 221.0,
                  child: Divider(
                    height: 30.0,
                    color: Colors.brown[900],
                  ),
                ),
                // Bir satır oluşturmak için satır önce 'Container' ile sarmalanıyor.
                Card(
                  // Yatayda 40-px dış boşluk vermek için 'margin' kullanıldı.
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  color: Colors.brown[900], // 'Container' renk değeri.
                  // 'Card' widget'ı padding property'sine sahip değil, boşluk vermek için çucuğu 'Padding' widget ile sarmalanır.
                  // 'ListTile' ile ön tanımlı cart elemanı yapısı kullanılabilir, bir kaç adet farklı türü vardır.
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    title: Text(
                      'istek@gonulkahvecisi.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  color: Colors.brown[900],
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    title: Text(
                      '555 555 55 55',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
