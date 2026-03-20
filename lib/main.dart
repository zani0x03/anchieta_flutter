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
  String _produto = "";
  double _sliderValue = 30.0;
  String? _selectedRadio = '';
  String _dropdownValue = 'Centro';
  bool _isCheckboxChecked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Olá Flutter')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Preencha com o nome do produto:',
                style: TextStyle(fontSize: 20),
              ),

              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Produto',
                  border: OutlineInputBorder(),
                ),
                onChanged: (valor) {
                  setState(() {
                    _produto = valor;
                  });
                },
              ),

              const Text(
                'Defina a quantidade:',
                style: TextStyle(fontSize: 20),
              ),

              Slider(
                value: _sliderValue,
                min: 1,
                max: 30,
                divisions: 30,
                label: _sliderValue.round().toString(),
                onChanged: (double val) => setState(() => _sliderValue = val),
                ),

                const Text(
                'Escolha o tipo de entrega:',
                style: TextStyle(fontSize: 20),
              ),

              Row(
                children: [
                  Radio<String>(
                  value: 'Carreto',
                  groupValue: _selectedRadio,
                  onChanged: (val) => setState(() => _selectedRadio = val),
                  ),
                  const Text('Carreto'),
                ],
              ),
              Row(children: [
                Radio<String>(
                  value: 'Retirada',
                  groupValue: _selectedRadio,
                  onChanged: (val) => setState(() => _selectedRadio = val),
                ),
                const Text('Retirada'),
                ],
              ),
              Row(children: [
                Radio<String>(
                  value: 'Correio',
                  groupValue: _selectedRadio,
                  onChanged: (val) => setState(() => _selectedRadio = val),
                ),
                const Text('Correio'),
                ],
              ),

              const Text(
                'Escolha a região:',
                style: TextStyle(fontSize: 20),
              ),

              DropdownButton<String>(
                value: _dropdownValue,
                onChanged: (String? newValue) {
                  setState(() => _dropdownValue = newValue!);
                },
                items: <String>['Centro', 'Norte', 'Sul', 'Leste', 'Oeste'] 
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                      );
                  })
                  .toList(),
              ),

              const Text(
                'Deseja receber promoções via e-mail?',
                style: TextStyle(fontSize: 20),
              ),

              Center(
                child: Row(
                  children: [
                    Checkbox(
                      value: _isCheckboxChecked,
                      onChanged: (bool? value) {
                        setState(() => _isCheckboxChecked = value!);
                      },
                    ),
                    Text('Sim, eu desejo receber promoções via e-mail.'),
                  ], 
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    
                  });
                },
                child: const Text('Cadastrar'),
              ),

              Text(
                'aa'
              ),
            ],
          ),
        ),
      ),
    );
  }
}
