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
  String _nomeProduto = '';
  String _resultado = '';
  double _sliderValue = 20.0;
  String? _selectedRadio = 'Carreto';
  String? _selectedRegiao = 'Sul';
  bool _isCheckboxChecked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Ola Flutter')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Digite o nome do produto',
                  border: OutlineInputBorder(),
                ),
                onChanged: (valor) => setState(() => _nomeProduto = valor),
              ),
              const SizedBox(height: 16),
              Text('Quantidade: ${_sliderValue.round()}'),
              Slider(
                value: _sliderValue,
                min: 0,
                max: 100,
                divisions: 100,
                label: _sliderValue.round().toString(),
                onChanged: (val) => setState(() => _sliderValue = val),
              ),
              const SizedBox(height: 8),
              const Text('Tipo de Entrega:'),
              Row(
                children: ['Carreto', 'Retirada', 'Correio'].map((tipo) {
                  return Row(
                    children: [
                      Radio<String>(
                        value: tipo,
                        groupValue: _selectedRadio,
                        onChanged: (val) => setState(() => _selectedRadio = val),
                      ),
                      Text(tipo),
                    ],
                  );
                }).toList(),
              ),
              const SizedBox(height: 8),
              const Text('Região:'),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedRegiao,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: ['Norte', 'Sul', 'Leste', 'Oeste', 'Centro']
                    .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                    .toList(),
                onChanged: (val) => setState(() => _selectedRegiao = val),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Checkbox(
                    value: _isCheckboxChecked,
                    onChanged: (val) => setState(() => _isCheckboxChecked = val!),
                  ),
                  const Text('Aceito os termos e receber e-mails'),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _resultado =
                          'Produto: $_nomeProduto\n'
                          'Quantidade: ${_sliderValue.round()}\n'
                          'Entrega: $_selectedRadio\n'
                          'Região: $_selectedRegiao\n'
                          'Termos aceitos: ${_isCheckboxChecked ? 'Sim' : 'Não'}';
                      _nomeProduto = '';
                      _controller.clear();
                    });
                  },
                  child: const Text('Cadastrar'),
                ),
              ),
              const SizedBox(height: 16),
              if (_resultado.isNotEmpty) Text(_resultado),
            ],
          ),
        ),
      ),
    );
  }
}