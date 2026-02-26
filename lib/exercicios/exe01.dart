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
            // Espaçamento interno para o texto não colar na borda
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.lightBlue[100], // Cor de fundo
              borderRadius: BorderRadius.circular(12), // Bordas arredondadas
              border: Border.all(color: Colors.lightBlue, width: 2), // Borda externa
            ),
            child: const Text(
              'Bem-vindo ao Flutter!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}