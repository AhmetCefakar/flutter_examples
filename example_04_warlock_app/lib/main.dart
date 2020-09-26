import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

// 'stless' => Bir snippet'tır ve 'StatelessWidget' template oluşturur.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[600],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple[900],
          title: Text(
            'Horoscope of this day',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: MainFoodPace(),
      ),
      debugShowCheckedModeBanner: false,
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
  String _horoscopeTopic;
  String _answer;

  // #region Uygulamada kullanılan değişkenler
  List<String> _answers = [
    'BOŞ: TIKLA FALIN GELSİN',
    'AŞK: Bugün, aşk ve ilişki hayatınızda biraz daha temkinli olmalısın. Onu her konuda doğru anlamda anladığından da emin misin?',
    'AŞK: Aşk ve ilişki hayatınızda hakimiyeti eline almak ve birlikteliğinizi dilediğiniz gibi yönlendirmek isteyebilirsin. Bu isteğinin denge içerisindeki bir ilişkiye ne şekilde fayda edeceğini gözden geçirmelisin.',
    'AŞK: Duygularınızın bugün biraz düzensiz olduğunu görebilirsiniz. Güne, daha önce hiç yapmadığınız bir şekilde başlamanızı sağlayan doğal bir elektrik hissi var. Kalbiniz her zaman doğruyu söyler.',
    'AŞK: Duygularınız çoğu zaman rasyonel düşüncelerinize galip geliyor ve sonunda derinlerde duyguların beslediği bir karmaşa ortaya çıkıyor. Çok da mantıklı düşünerek kalbinizi görmezden gelmeyin. Amacınız bu ikisi arasında dengeyi bulmak.',
    'AŞK: Duygusal olarak kötü hissetmeyin, sezgileriniz güçlü durumda. Sevgilinizin hislerini bu sezgiler ile anlamaya çalışın. Bazen sadece eğlenmek gerekir, siz de rahatlayın ve birlikte eğlenin!',
    'PARA: Kafanıza uzun süredir koyduğunuz bazı harcamalar var, bugün kendinize bunlara gerçekten ne kadar ihtiyacınız olduğunu sorun ve bir kısmını iptal edin. Bugün bir hayır kurumuna küçücük bir bağış yapın, kendinizi çok daha iyi hissedeceksiniz.',
    'PARA: Nakit akışınızın dengesini bozabilecek dönemlere giriyoruz, bu aralar kesinlikle masa başına oturup bir bütçe hesabı yapmalısınız, önümüzdeki 3 ay boyunca gelir gider dengenizden emin olmadan hareket etmeyin',
    'PARA: Bugün, başkalarına yardım, destek ve hizmet duygunuzun yüksek olduğu bir gün olabilir, hayır, bağış işlerinde yer alabilirsiniz.',
    'PARA: Bugün kendinize güveniniz oldukça yüksek, ancak bu size pek fayda getirmeyebilir, bağlantılarınız size verdikleri destekten şüphelenebilirler. Sakin hareket edin, bir adım geri durun, ve paradan çok sağlığınızla ilgilenin.',
    'PARA: Para kaynaklarımız ile ilgili detaylar bu dönem dikkat etmelisiniz. Ayrıca maddi konularda ve harcamalarda uzun süredir sizi meşgul eden bir konuda karara varabilirsiniz, yakınlarınızdan veya eşinizden karar alırken yardım isteyin.',
    'TAVSİYE: Bugün meraklı kişiliğini ön plana çıkartarak insanlara soru sormaktan çekinme ',
    'TAVSİYE: Bugün daha önce hiç fark etmediğin şeylerin hep orada olduğunu fark edebilirsin, sadece biraz daha dikkatli olmaya çalış',
    'TAVSİYE: Bugün ikili ilişkilerinde daha aktif ve verici olmaya çalışabilirsin, aynı fikirde olduğun insanları daha dikkatli dinlemeye ve sorgulamaya başla',
    'TAVSİYE: Bugün sadece işine odaklan, dikkatini dağıtacak her türlü nesne ve sosyal medyadan uzaklaşmak kendini daha mutlu hissettirebilir',
    'TAVSİYE: Bugün tek başına biraz yürüyüş yap, çocukluğunda dinlediğin şarkıları aç ve o zamanlar oynadığın oyunları hayal et'
  ];
  // #endregion

  // Boş kurucu tanımı
  _MainFoodPaceState() {
    _horoscopeTopic = 'BOŞ';
    _answer = _answers[0];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 50.0),
          CircleAvatar(
            radius: 70,
            backgroundColor: Colors.purple[600],
            backgroundImage: AssetImage('assets/images/falci.png'),
          ),
          SizedBox(height: 15.0),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            child: ListTile(
              onTap: () {
                _horoscopeTopic = 'AŞK';
                onPressForFortuneTelling();
              },
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              title: Text(
                'Your love status',
                style: TextStyle(
                  fontSize: 17.07,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            child: ListTile(
              onTap: () {
                _horoscopeTopic = 'PARA';
                onPressForFortuneTelling();
              },
              leading: Icon(
                Icons.attach_money,
                color: Colors.green,
              ),
              title: Text(
                'Your money status',
                style: TextStyle(
                  fontSize: 17.07,
                  color: Colors.green,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            child: ListTile(
              onTap: () {
                _horoscopeTopic = 'TAVSİYE';
                onPressForFortuneTelling();
              },
              leading: Icon(
                Icons.record_voice_over,
                color: Colors.blue,
              ),
              title: Text(
                'Advice of the day',
                style: TextStyle(
                  fontSize: 17.07,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Text(
                _answer.trim().split(':')[1],
                style: TextStyle(
                  fontSize: 15.07,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void onPressForFortuneTelling() {
    setState(() {
      int _randomValue = Random().nextInt(5);

      _answer = _answers
          .where((value) => value.contains(_horoscopeTopic))
          .toList()[_randomValue];

      // print('_horoscopeTopic => $_horoscopeTopic, _randomValue => $_randomValue \n');
      // print('_answer => $_answer \n\r');

      // _answer = _selectedTopicList[_randomValue].trim().split(':')[1];
      // print('sfsdf: $_answer \n\r');
    });
  }
}
