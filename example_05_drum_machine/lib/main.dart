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
                  child: buildDrumPadButton('bip.wav', Colors.blueAccent),
                ),
                Expanded(
                  child: buildDrumPadButton('bongo.wav', Colors.redAccent),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: buildDrumPadButton('clap1.wav', Colors.amberAccent[400]),
                ),
                Expanded(
                  child: buildDrumPadButton('clap2.wav', Colors.purpleAccent),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: buildDrumPadButton('clap3.wav', Colors.purple[900]),
                ),
                Expanded(
                  child: buildDrumPadButton('crash.wav', Colors.lime[300]),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: buildDrumPadButton('how.wav', Colors.greenAccent),
                ),
                Expanded(
                  child: buildDrumPadButton('oobah.wav', Colors.teal[300]),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: buildDrumPadButton('ridebel.wav', Colors.deepOrangeAccent[400]),
                ),
                Expanded(
                  child: buildDrumPadButton('woo.wav', Colors.indigoAccent),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Basılınca ses veren buton oluşturulmasını renk ve ses dosyası parametrelerini alarak
  /// gerçekleştiren metod.
  FlatButton buildDrumPadButton(String _audioName, Color _padColor) {
    return FlatButton(
      padding: EdgeInsets.all(7.0),
      onPressed: () {
        playAudio(_audioName); // assets/audios/aaa.wav
      },
      child: Container(
        color: _padColor,
      ),
    );
  }

  /// Seslerin tek bir yerden çalınmasını sağlamak için kullaınlan metod.
  /// Bütün ses dosyalarının 'assets/audios/' konumuna atıldığı varsayılmaktadır.
  void playAudio(String audioName) {
    audioPlayer.play(audioName);
  }
}
