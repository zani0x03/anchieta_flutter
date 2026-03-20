import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _controller = TextEditingController();
  String _selectedPickup = 'Carreto';
  bool _promo = false;
  double _sliderValue = 0;
  String _resultText = '';
  String regiao = 'Sul';

  void _register() {
    setState(() {
      _resultText = 'Produto: ${_controller.text}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio Flutter'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Text('Preencher com o nome do produto')),
            TextField(
              key: const Key('productTextField'),
              controller: _controller,
              decoration: InputDecoration(labelText: 'Nome do Produto'),
            ),
            const SizedBox(height: 10),
            Slider(
              key: const Key('slider'),
              value: _sliderValue,
              min: 0,
              max: 100,
              onChanged: (v) {
                setState(() => _sliderValue = v);
              },
            ),
            const SizedBox(height: 8),
            Center(child: Text('Escolha o tipo de entrega')),
            const SizedBox(height: 10),
            RadioListTile<String>(
              title: const Text('Carreto'),
              value: 'Carreto',
              groupValue: _selectedPickup,
              onChanged: (value) {
                setState(() {
                  _selectedPickup = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Retirada'),
              value: 'Retirada',
              groupValue: _selectedPickup,
              onChanged: (value) {
                setState(() {
                  _selectedPickup = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Correio'),
              value: 'Correio',
              groupValue: _selectedPickup,
              onChanged: (value) {
                setState(() {
                  _selectedPickup = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Aceitar Termos'),
              value: _promo,
              onChanged: (value) {
                setState(() {
                  _promo = value ?? false;
                });
              },
            ),
            SizedBox(height: 10),
            Center(child: Text('Selecione a Região')),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: regiao,
              items: const [
                DropdownMenuItem(value: 'Norte', child: Text('Norte')),
                DropdownMenuItem(value: 'Sul', child: Text('Sul')),
                DropdownMenuItem(value: 'Leste', child: Text('Leste')),
                DropdownMenuItem(value: 'Oeste', child: Text('Oeste')),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  regiao = newValue!;
                });
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _register,
              child: const Text('Cadastrar'),
            ),
            const SizedBox(height: 16),
            if (_resultText.isNotEmpty)
              Text(
                _resultText,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            if (_resultText.isNotEmpty)
              Text('Modalidade: $_selectedPickup, Termos: $_promo'),

            if (_resultText.isNotEmpty) Text('Região: $regiao'),

            if (_resultText.isNotEmpty)
              Text('Quantidade: ${_sliderValue.toStringAsFixed(1)}'),
          ],
        ),
      ),
    );
  }
}
