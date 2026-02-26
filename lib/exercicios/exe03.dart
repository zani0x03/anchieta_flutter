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
        body: Row(
          // Isso distribui os elementos com espaço igual entre eles
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
          children: [
            Container(
              width: 60, height: 60, color: Colors.red,
              child: const Center(child: Text('Red', style: TextStyle(color: Colors.white))),
            ),
            Container(
              width: 60, height: 60, color: Colors.green,
              child: const Center(child: Text('Green', style: TextStyle(color: Colors.white))),
            ),
            Container(
              width: 60, height: 60, color: Colors.blue,
              child: const Center(child: Text('Blue', style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
      ),
    );
  }
}