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
  String productName = '';
  double _sliderValue = 20.0;
  String? _selectedRadio = 'A';
  String _dropdownValue = 'Norte';
  bool _isCheckboxChecked = false;
  String _resultado = '';
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Olá Flutter')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Preencha com o nome do produto',
                ),
                onChanged: (text) => setState(() => productName = text),
              ),
              Text("Slider (Valor: ${_sliderValue.round()}):"),
              Slider(
                value: _sliderValue,
                min: 0,
                max: 100,
                divisions: 100,
                label: _sliderValue.round().toString(),
                onChanged: (double val) => setState(() => _sliderValue = val),
              ),
              const Text("RadioButton:"),
              Column(
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Carreto',
                        groupValue: _selectedRadio,
                        onChanged: (val) =>
                            setState(() => _selectedRadio = val),
                      ),
                      const Text("Carreto"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Retirada',
                        groupValue: _selectedRadio,
                        onChanged: (val) =>
                            setState(() => _selectedRadio = val),
                      ),
                      const Text("Retirada"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Correio',
                        groupValue: _selectedRadio,
                        onChanged: (val) =>
                            setState(() => _selectedRadio = val),
                      ),
                      const Text("Correio"),
                    ],
                  ),
                ],
              ),
              const Text("Escolha a região:"),
              DropdownButton<String>(
                value: _dropdownValue,
                onChanged: (String? newValue) {
                  setState(() => _dropdownValue = newValue!);
                },
                items: <String>['Norte', 'Sul', 'Leste', 'Oeste']
                    .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    })
                    .toList(),
              ),
              const Text("Deseja receber promoções via e-mail?"),
              Checkbox(
                value: _isCheckboxChecked,
                onChanged: (bool? value) {
                  setState(() => _isCheckboxChecked = value!);
                },
              ),
              const Text("Sim, desejo receber promoções via e-mail"),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _resultado =
                        'Produto: $productName\n'
                        'Valor: ${_sliderValue.round()}\n'
                        'Entrega: $_selectedRadio\n'
                        'Região: $_dropdownValue\n'
                        'Promoções: ${_isCheckboxChecked ? "Sim" : "Não"}';

                    _controller.clear();
                  });
                },
                child: Text('Cadastrar'),
              ),
              if (_resultado.isNotEmpty) ...[
                SizedBox(height: 20),
                Text(_resultado),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
