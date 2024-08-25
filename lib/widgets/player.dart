import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // on va écouter la durée de la piste
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        totalDuration = duration;
      });

      // on va écouter ici la position courante
      _audioPlayer.onPositionChanged.listen((position) {
        setState(() {
          currentPosition = position;
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  // je vais maintenant  au  codage des méthodes pour contrôle de la track

  /// la méthode playMusic
  void _playMusic() async {
    try {
      await _audioPlayer.play(UrlSource(''));
      setState(() {
        isPlaying = true;
      });
    } catch (e) {
      print('error dans $e');
    }
  }

// la méthode pause
  void _pauseMusic() async {
    try {
      await _audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } catch (e) {
      print('erreur pause $e');
    }
  }

  // la méthode stop arreter la music même si je penses qu'elle n'est pas importante
  void _stopMusic() async {
    try {
      await _audioPlayer.stop();
    } catch (e) {
      print('erreur stop $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 247, 126, 5),
            Colors.black26,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('SawTi Na '),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.account_balance_wallet_sharp))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              height: 300,
              child: Card(
                color: const Color.fromARGB(255, 100, 100, 100),
                shadowColor: Colors.black54,
                child: Expanded(
                  child: Icon(Icons.music_note),
                ),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.pause_circle_outline),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_sharp),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
