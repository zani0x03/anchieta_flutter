import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text('Hello World!'),
//         ),
//       ),
//     );
//   }
// }


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
          padding: const EdgeInsets.all(10),
          alignment: Alignment.topCenter,
          width: 200.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(),
          ),
          child: Text(
            'Hello World',
            style: TextStyle(
              fontSize: 32,
            ),
          )
        ),
      ),
    );
  }
}