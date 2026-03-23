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
  final TextEditingController _controller = TextEditingController();
  double _sliderValue = 0.5;
  int _radioValue = 0;
  String _dropdownValue = 'Opção 1';
  bool _checkboxValue = false;
  String? _resultado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Olá Flutter')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 8,
            children: [
              Column(
                children: [
                  Text('Preencha com o nome do Produto:'),
                  TextField(controller: _controller),
                ],
              ),
              Column(
                children: [
                  Text('Defina a quantidade:'),
                  Slider(
                    value: _sliderValue,
                    min: 0,
                    max: 10,
                    onChanged: (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  Text('Selecione a forma de entrega:'),
                  RadioGroup<int>(
                    groupValue: _radioValue,
                    onChanged: (value) {
                      setState(() {
                        _radioValue = value!;
                      });
                    },
                    child: Column(
                      children: [
                        Row(children: [Radio<int>(value: 0), Text('Entrega')]),
                        Row(children: [Radio<int>(value: 1), Text('Retirada')]),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text('Selecione uma opção:'),
                  DropdownButton<String>(
                    value: _dropdownValue,
                    items: [
                      DropdownMenuItem(
                        value: 'Opção 1',
                        child: Text('Opção 1'),
                      ),
                      DropdownMenuItem(
                        value: 'Opção 2',
                        child: Text('Opção 2'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _dropdownValue = value!;
                      });
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  Text('Deseja receber promoções via e-mail?'),
                  Row(
                    children: [
                      Checkbox(
                        value: _checkboxValue,
                        onChanged: (value) {
                          setState(() {
                            _checkboxValue = value!;
                          });
                        },
                      ),
                      Text('Sim, eu desejo receber promoções via e-mail!'),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _resultado = _controller.text;
                    _controller.clear();
                  });
                },
                child: Text('Cadastrar'),
              ),
              if (_resultado != null) Text(_resultado!),
            ],
          ),
        ),
      ),
    );
  }
}
