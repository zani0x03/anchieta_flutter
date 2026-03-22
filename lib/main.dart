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
  // final TextEditingController _dateController = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  String _nomeProduto = "";
  String _resultado = '';
  String _Tipo_de_entrega = '';
  double _sliderValue = 20.0;
  String? _selectedRadio = 'A';
  bool _isCheckboxChecked = false;
  String _dropdownValue = 'Norte';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Olá Flutter')),
        body: Center(
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Digite o nome do produto',
                  border: OutlineInputBorder(),
                ),
                onChanged: (valor) {
                  setState(() {
                    _nomeProduto = valor;
                  });
                },
              ),
              // Text(_resultado),
              Text("Quantidade: ${_sliderValue.round()}:"),
              Slider(
                value: _sliderValue,
                min: 0,
                max: 100,
                divisions: 100,
                label: _sliderValue.round().toString(),
                onChanged: (double val) => setState(() => _sliderValue = val),
              ),
              const Text("Tipo de entrega:"),
              Row(
                children: [
                  Radio<String>(
                    value: 'Retirada',
                    groupValue: _selectedRadio,
                    onChanged: (val) => setState(() => _selectedRadio = val),
                  ),
                  const Text("Retirada"),
                  Radio<String>(
                    value: 'Entrega',
                    groupValue: _selectedRadio,
                    onChanged: (val) => setState(() => _selectedRadio = val),
                  ),
                  const Text("Entrega"),
                  Radio<String>(
                    value: 'Carreto',
                    groupValue: _selectedRadio,
                    onChanged: (val) => setState(() => _selectedRadio = val),
                  ),
                  const Text("Carreto"),
                ],
              ),
              const Text("Região:"),
              DropdownButton<String>(
                value: _dropdownValue,
                onChanged: (String? newValue) {
                  setState(() => _dropdownValue = newValue!);
                },
                items: <String>['Norte', 'Sudeste', 'Centro-oeste']
                    .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    })
                    .toList(),
              ),
              const Text("Selecione para permitir o envio de email:"),
              Checkbox(
                value: _isCheckboxChecked,
                onChanged: (bool? value) {
                  setState(() => _isCheckboxChecked = value!);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _resultado = _nomeProduto;
                    _Tipo_de_entrega = _dropdownValue;
                    _controller.clear();
                  });
                },
                child: Text('Cadastrar'),
              ),
              Text(_resultado),
              Text(_Tipo_de_entrega),
              Text(_resultado),
            ],
          ),
        ),
      ),
    );
  }
}
