import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// 'stless' => Bir snippet'tır ve 'StatelessWidget' template oluşturur.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'What Can Eat Today',
            style: TextStyle(color: Colors.cyan[800]),
          ),
        ),
        body: MainFoodPace(),
      ),
    );
  }
}

/// 'stful' => Bir snippet'tır ve 'StatefulWidget' template oluşturur.
/// Bir 'StatefulWidget' her zaman bir generick 'State' ile birlikte kullanılır.
class MainFoodPace extends StatefulWidget {
  @override
  _MainFoodPaceState createState() => _MainFoodPaceState();
}

class _MainFoodPaceState extends State<MainFoodPace> {
  int _soupNo = 1;
  int _mainFoodNo = 1;
  int _aftersNo = 1;

  // #region Description
  List<String> _soupTitles = [
    'Lentil soup', // Mercimek çorbası
    'Tarhana soup',
    'Chicken Broth Soup', // Tavuk Suyu çorbası
    'Wedding soup', // Düğün çorbası
    'Yoghurt soup' // Yoğurt çorbası
  ];

  List<String> _mainFoodTitles = [
    'Eggplant meal', // Karnıyarık yemeği
    'Pasty meal', // Mantı
    'Haricot bean meal', // Kuru Fasulye
    'Stuffed meatballs', // İçli Köfte
    'Grilled fish' // Izgara Balık
  ];

  List<String> _aftersTitles = [
    'Kadayif',
    'Baklava',
    'Rice pudding', // Sütlaç
    'Kazandibi',
    'Ice cream'
  ];
  // #endregion

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          // 'Expanded' widget diğer bir widget'ın kaplayacağı alanın ekrana göre esnek olması için kullanılır.
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: FlatButton(
                // color: Colors.white,
                highlightColor: Colors.white, // Vurgu rengi
                splashColor: Colors.white, // Tıklanmada dalgalanma efekti
                onPressed: () => onPressForFood(),

                // 'onPressed' işlemi için doğrudan metod içine yazılması
                // onPressed:  () {
                // setState(() {
                //   _soupNo += 1;

                //   if (_soupNo > 5) {
                //     _soupNo = 1;
                //   }
                // });
                // print('Clicked soup \'corba_$_soupNo.jpg\' image!');
                // },

                child: Image.asset('assets/images/corba_$_soupNo.jpg'),
              ),
            ),
          ),
          Text(
            _soupTitles[_soupNo - 1],
            style: TextStyle(fontSize: 20.0),
          ),
          Container(
            width: 300.0,
            child: Divider(
              height: 5.0,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: FlatButton(
                highlightColor: Colors.white,
                splashColor: Colors.white,
                onPressed: onPressForFood, // 'onPressForFood' metodu çağırılır.
                child: Image.asset('assets/images/yemek_$_mainFoodNo.jpg'),
              ),
            ),
          ),
          Text(
            _mainFoodTitles[_mainFoodNo - 1],
            style: TextStyle(fontSize: 20.0),
          ),
          Container(
            width: 300.0,
            child: Divider(
              height: 5.0,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: FlatButton(
                highlightColor: Colors.white,
                splashColor: Colors.white,
                onPressed: () => onPressForFood(),
                child: Image.asset('assets/images/tatli_$_aftersNo.jpg'),
              ),
            ),
          ),
          Text(
            _aftersTitles[_aftersNo - 1],
            style: TextStyle(fontSize: 20.0),
          ),
          Container(
            width: 300.0,
            child: Divider(
              height: 5.0,
            ),
          ),
        ],
      ),
    );
  }

  void onPressForFood() {
    setState(() {
      _soupNo += 1;
      if (_soupNo > 5) {
        _soupNo = 1;
      }
      print('Clicked soup \'corba_$_soupNo.jpg\' image!');

      _mainFoodNo += 1;
      if (_mainFoodNo > 5) {
        _mainFoodNo = 1;
      }
      print('Clicked soup \'corba_$_mainFoodNo.jpg\' image!');

      _aftersNo += 1;
      if (_aftersNo > 5) {
        _aftersNo = 1;
      }
      print('Clicked soup \'corba_$_aftersNo.jpg\' image!');
    });

    print('Clicked soup \'corba_$_soupNo.jpg\' image!');
  }
}
