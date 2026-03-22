import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _sliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Olá Flutter')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Preenche com o nome do Produto:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
              ),
              Padding(
                padding: EdgeInsets.all(20), 
                child: 
                TextField(
                  onChanged: (value) {
                    setState(() {
                      // depois?
                    });
                  },
                  autocorrect: true, 
                  decoration: 
                  InputDecoration(
                    hintText: "Nome do produto",
                    labelText: "Produto", 
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.person)
                  )
                )
              ),
              Text(
                "Defina a quantidade:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
              ),
              Slider(
                value: _sliderValue, 
                min: 0.0,
                max: 100.0,
                label: _sliderValue.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
