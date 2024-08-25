import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
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
