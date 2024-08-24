import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
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

    // Écoute les changements de durée
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        totalDuration = duration;
      });
    });

    // Écoute les changements de position
    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        currentPosition = position;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playMusic() async {
    try {
      await _audioPlayer.play(UrlSource(
          'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3')); // URL d'exemple
      setState(() {
        isPlaying = true;
      });
    } catch (e) {
      print("Erreur lors de la lecture : $e");
    }
  }

  void _pauseMusic() async {
    try {
      await _audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } catch (e) {
      print("Erreur lors de la pause : $e");
    }
  }

  void _stopMusic() async {
    try {
      await _audioPlayer.stop();
      setState(() {
        isPlaying = false;
        currentPosition = Duration.zero;
      });
    } catch (e) {
      print("Erreur lors de l'arrêt : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Player"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isPlaying ? "Playing Music" : "Music Paused",
            style: TextStyle(fontSize: 24),
          ),
          Slider(
            value: currentPosition.inSeconds.toDouble(),
            max: totalDuration.inSeconds.toDouble(),
            onChanged: (value) async {
              await _audioPlayer.seek(Duration(seconds: value.toInt()));
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: isPlaying ? _pauseMusic : _playMusic,
              ),
              IconButton(
                icon: Icon(Icons.stop),
                onPressed: _stopMusic,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
