import 'package:flutter/material.dart';

class FormOne extends StatelessWidget {
  const FormOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.lightBlueAccent,
            const Color.fromARGB(255, 33, 34, 33)
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(
                      255, 125, 124, 126), // Couleur du texte du bouton
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
