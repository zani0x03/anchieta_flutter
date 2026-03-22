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
  final TextEditingController _produtoController = TextEditingController();
  double _quantidade = 1;
  String _tipoEntrega = 'Entrega';
  bool _promocoes = false;
  String _resultado = '';

  @override
  void dispose() {
    _produtoController.dispose();
    super.dispose();
  }

  void _cadastrar() {
    final produto = _produtoController.text;
    setState(() {
      _resultado =
          'Produto: $produto | Qtd: ${_quantidade.toStringAsFixed(0)} | Tipo: $_tipoEntrega | Promocoes: ${_promocoes ? 'Sim' : 'Nao'}';
      _produtoController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Produto')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _produtoController,
              decoration: const InputDecoration(
                labelText: 'Nome do produto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Text('Quantidade: ${_quantidade.toStringAsFixed(0)}'),
            Slider(
              value: _quantidade,
              min: 1,
              max: 10,
              divisions: 9,
              label: _quantidade.toStringAsFixed(0),
              onChanged: (value) {
                setState(() {
                  _quantidade = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Entrega'),
              value: 'Entrega',
              groupValue: _tipoEntrega,
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _tipoEntrega = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Retirada'),
              value: 'Retirada',
              groupValue: _tipoEntrega,
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _tipoEntrega = value;
                });
              },
            ),
            Row(
              children: [
                Checkbox(
                  value: _promocoes,
                  onChanged: (value) {
                    setState(() {
                      _promocoes = value ?? false;
                    });
                  },
                ),
                const Text('Receber promoções'),
              ],
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _cadastrar,
              child: const Text('Cadastrar'),
            ),
            const SizedBox(height: 16),
            if (_resultado.isNotEmpty) Text(_resultado),
          ],
        ),
      ),
    );
  }
}
