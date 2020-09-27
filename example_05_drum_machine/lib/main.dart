import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DrumMachine());
}

class DrumMachine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: DrumPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DrumPage extends StatelessWidget {
  /* 
   * 'prefix' değeri ile ses dosyalarının carsayılan konumu olan 'assets/' yerine 
   * 'assets/audios/' altından dosyaların okunması sağlanmıştır.
   * 
  * */
  final audioPlayer = AudioCache(prefix: 'assets/audios/', respectSilence: true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                // 'Expanded' widget'ı bir elemanın kapladığı alanı genişletmek için kullanılılabilir.
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.all(7.0),
                    onPressed: () {
                      playAudio('bip.wav'); // assets/audios/bongo.wav
                    },
                    child: Container(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.all(7.0),
                    onPressed: () {
                      playAudio('bongo.wav');
                    },
                    child: Container(
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.all(7.0),
                    onPressed: () {
                      playAudio('clap1.wav');
                    },
                    child: Container(
                      color: Colors.amberAccent[400],
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.all(7.0),
                    onPressed: () {
                      playAudio('clap2.wav');
                    },
                    child: Container(
                      color: Colors.purpleAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.all(7.0),
                    onPressed: () {
                      playAudio('clap1.wav');
                    },
                    child: Container(
                      color: Colors.purple[900],
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.all(7.0),
                    onPressed: () {
                      playAudio('crash.wav');
                    },
                    child: Container(
                      color: Colors.lime[300],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.all(7.0),
                    onPressed: () {
                      playAudio('how.wav');
                    },
                    child: Container(
                      color: Colors.greenAccent,
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.all(7.0),
                    onPressed: () {
                      playAudio('oobah.wav');
                    },
                    child: Container(
                      color: Colors.teal[300],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.all(7.0),
                    onPressed: () {
                      playAudio('ridebel.wav');
                    },
                    child: Container(
                      color: Colors.deepOrangeAccent[400],
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.all(7.0),
                    onPressed: () {
                      playAudio('woo.wav');
                    },
                    child: Container(
                      color: Colors.indigoAccent,
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

  /// Seslerin tek bir yerden çalınmasını sağlamak için kullaınlan metod.
  /// Bütün ses dosyalarının 'assets/audios/' konumuna atıldığı varsayılmaktadır.
  void playAudio(String audioName) {
    audioPlayer.play(audioName);
  }
}
