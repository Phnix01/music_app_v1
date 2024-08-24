import 'package:flutter/material.dart';
import 'package:authentification_project/widgets/player.dart';

class FormOne extends StatefulWidget {
  const FormOne({super.key});

  @override
  _FormOneState createState() => _FormOneState();
}

class _FormOneState extends State<FormOne> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  void _valider() {
    String controller1 = _controller1.text;
    String controller2 = _controller2.text;

    if (controller1.isEmpty || controller2.isEmpty) {
      // Afficher un message d'erreur ou faire quelque chose si les champs sont vides
      return;
    } else {
      if (controller1 == "Phnix01" && controller2 == "fomar9235@gmail.com") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => Player()));
      } else {
        // Afficher un message d'erreur si les informations ne sont pas correctes
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.lightBlueAccent,
            const Color.fromARGB(255, 33, 34, 33),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 50),
              child: Center(
                child: Icon(
                  Icons.verified_user_rounded,
                  color: Colors.white70,
                  size: 150,
                ),
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                controller: _controller1,
                maxLength: 25,
                decoration: InputDecoration(
                  labelText: "Pseudo",
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                controller: _controller2,
                maxLength: 50,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              width: 200,
              child: ElevatedButton(
                onPressed: _valider,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 125, 124, 126),
                ),
                child: Text('Valider'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
