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
  double _sliderValue = 20.0;
  String? _selectedRadio = "Carreto";
  String _dropdownValue = "Centro";
  bool _isCheckboxChecked = false;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Olá Flutter')),
      body: Center(
        child: Column(
          children: [
            const Text('Preencha com o nome do produto:'),

            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Produto",
              ),
            ),

            const SizedBox(height: 20),

            const Text('Defina a quantidade:'),
            Slider(
              min: 0,
              max: 100,
              value: _sliderValue,
              label: _sliderValue.round().toString(),
              onChanged: (double val) {
                setState(() => _sliderValue = val);
              },
            ),

            const SizedBox(height: 20),

            const Text("Escolha o tipo de entrega:"),

            Row(
              children: [
                Radio<String>(
                  value: "Carreto",
                  groupValue: _selectedRadio,
                  onChanged: (val) {
                    setState(() => _selectedRadio = val);
                  },
                ),
                const Text("Carreto"),
              ],
            ),

            Row(
              children: [
                Radio<String>(
                  value: "Retirada",
                  groupValue: _selectedRadio,
                  onChanged: (val) {
                    setState(() => _selectedRadio = val);
                  },
                ),
                const Text("Retirada"),
              ],
            ),

            Row(
              children: [
                Radio<String>(
                  value: "Correio",
                  groupValue: _selectedRadio,
                  onChanged: (val) {
                    setState(() => _selectedRadio = val);
                  },
                ),
                const Text("Correio"),
              ],
            ),

            const Text("Escolha uma região:"),

            DropdownButton<String>(
              value: _dropdownValue,
              onChanged: (String? newValue) {
                setState(() => _dropdownValue = newValue!);
              },
              items: <String>['Centro', 'Leste', 'Oeste']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            const Text("Deseja receber promoções via e-mail?"),

            Row(
              children: [
                Checkbox(
                  value: _isCheckboxChecked,
                  onChanged: (bool? value) {
                    setState(() => _isCheckboxChecked = value!);
                  },
                ),
                const Text("Sim, eu desejo receber promoções via e-mail.")
              ],
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  _resultado =
                      "Produto: ${_controller.text}\n"
                      "Quantidade: ${_sliderValue.round()}\n"
                      "Entrega: $_selectedRadio\n"
                      "Região: $_dropdownValue\n"
                      "Promoções: ${_isCheckboxChecked ? "Sim" : "Não"}";
                });
              },
              child: const Text('Cadastrar'),
            ),
            Text(_resultado), 
          ],
        ),
      ),
    );
  }
}