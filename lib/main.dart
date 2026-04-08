import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _produtoController = TextEditingController();
  double _sliderValue = 0;
  String _selectedRadio = 'Correio';
  String _dropdownValue = 'Centro';
  bool _isCheckboxChecked = false;
  String _resultado = ''; 

  void _cadastrar() {
    setState(() {
      // O teste escreve "Produto X" no TextField. 
      // Esta linha garante que o widget Text exiba EXATAMENTE o que foi escrito.
      _resultado = _produtoController.text;
      _produtoController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Olá Flutter")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // FASE 1
            TextField(
              controller: _produtoController,
              decoration: const InputDecoration(labelText: 'Produto'),
            ),
            // FASE 2
            Slider(
              value: _sliderValue,
              max: 100,
              onChanged: (val) => setState(() => _sliderValue = val),
            ),
            // FASE 3
            RadioListTile(
              title: const Text("Carreto"),
              value: "Carreto",
              groupValue: _selectedRadio,
              onChanged: (val) => setState(() => _selectedRadio = val.toString()),
            ),
            RadioListTile(
              title: const Text("Retirada"),
              value: "Retirada",
              groupValue: _selectedRadio,
              onChanged: (val) => setState(() => _selectedRadio = val.toString()),
            ),
            RadioListTile(
              title: const Text("Correio"),
              value: "Correio",
              groupValue: _selectedRadio,
              onChanged: (val) => setState(() => _selectedRadio = val.toString()),
            ),
            // DROPDOWN
            DropdownButton<String>(
              value: _dropdownValue,
              isExpanded: true,
              items: ['Centro', 'Norte', 'Sul', 'Leste', 'Oeste']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => _dropdownValue = val!),
            ),
            // FASE 4
            Checkbox(
              value: _isCheckboxChecked,
              onChanged: (val) => setState(() => _isCheckboxChecked = val!),
            ),
            // FASE 5 (Gatilho)
            ElevatedButton(
              onPressed: _cadastrar,
              child: const Text("Cadastrar"),
            ),
            const SizedBox(height: 20),
            // FASE 5 (Validação): O teste procura por este texto aqui:
            Text(_resultado), 
          ],
        ),
      ),
    );
  }
}