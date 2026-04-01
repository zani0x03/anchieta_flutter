import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MainApp()
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Olá Flutter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Você está na tela 1', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const MainAppTela2())
              );
            }, child: Text('Ir para Tela 2')),
          ],
        ),
      ),
    );
  }
}

class MainAppTela2 extends StatelessWidget {
  const MainAppTela2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aula Flutter')),
      body: Center(
        child: Column(
          children: [
            const Text('Você está na tela 2', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text('Ir para Tela 1')),
          ],
        ),
      ),
    );
  }
}
