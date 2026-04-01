import 'package:flutter/material.dart';

void main() {
  runApp(const MainAppTela2());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Olá Flutter')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               const Text('Você está na tela 1', style: TextStyle(fontSize: 24),),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {}, 
                child: Text('Ir para Tela 2')
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MainAppTela2 extends StatelessWidget {
  const MainAppTela2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Aula Flutter')),
        body: Center(
          child: Column(
            children: [
              const Text('Você está na tela 2', style: TextStyle(fontSize: 24),),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: () {}, child: Text('Ir para Tela 1'))
            ],
          ),
        ),
      ),
    );
  }
}