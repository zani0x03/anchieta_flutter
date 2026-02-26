import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 300,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue[800],
              borderRadius: BorderRadius.circular(15),
            ),
            // O segredo aqui é o Align como filho do Container
            child: const Align(
              alignment: Alignment.bottomRight, // Alinha no canto inferior direito
              child: Padding(
                padding: EdgeInsets.all(16.0), // Afasta um pouco da quina
                child: Text(
                  'Início',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}