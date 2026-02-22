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
        appBar: AppBar(
          title: Text('Olá Flutter'),
        ),
        body: Container(
          // padding: const EdgeInsets.all(20),
          padding: const EdgeInsets.fromLTRB(50, 120, 10, 10),
          color: Colors.white,
          width: 200.0,
          height: 200.0,
          child: Text(
            'Hello World',
            style: TextStyle(
              fontSize: 32,
              color: Colors.black87,
            ),
          )
        ),
      ),
    );
  }
}