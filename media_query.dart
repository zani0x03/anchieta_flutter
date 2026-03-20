import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Media Query - Exemplo'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Tamanho: ${media.size}', style: TextStyle(fontSize: 20.0),),
              Text('Orientação: ${media.orientation}', style: TextStyle(fontSize: 20.0),),
              Text('Hora (24h): ${media.alwaysUse24HourFormat}', style: TextStyle(fontSize: 20.0),),
              Text('Brilho: ${media.platformBrightness}', style: TextStyle(fontSize: 20.0),),
              Text('Acessibilidade: ${media.accessibleNavigation}', style: TextStyle(fontSize: 20.0),),
            ],
          ),
          )
      ),
    );
  }
}