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
        body: Column(
          // Centraliza a coluna inteira na tela (se estiver dentro de um Center ou similar)
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100, height: 50, color: Colors.yellow[700],
              child: const Center(child: Text('Yellow')),
            ),
            const SizedBox(height: 10), // Espaço opcional entre eles
            Container(
              width: 100, height: 50, color: Colors.purple,
              child: const Center(child: Text('Purple', style: TextStyle(color: Colors.white))),
            ),
            const SizedBox(height: 10),
            Container(
              width: 100, height: 50, color: Colors.orange,
              child: const Center(child: Text('Orange', style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
      ),
    );
  }
}