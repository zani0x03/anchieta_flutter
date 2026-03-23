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
  String _tipoEntrega = 'Carreto';
  String _regiao = 'Norte';
  bool _aceitaTermos = false;
  String _resultado = '';

  @override
  void dispose() {
    _produtoController.dispose();
    super.dispose();
  }

  void _cadastrar() {
    final nomeProduto = _produtoController.text;
    setState(() {
      _resultado =
          'Produto: $nomeProduto | Quantidade: ${_quantidade.round()} | '
          'Entrega: $_tipoEntrega | Regiao: $_regiao | Aceita termos: ${_aceitaTermos ? 'Sim' : 'Nao'}';
      _produtoController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Produto')),
      body: SingleChildScrollView(
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
            const Text('Quantidade'),
            Slider(
              min: 1,
              max: 10,
              divisions: 9,
              value: _quantidade,
              label: _quantidade.round().toString(),
              onChanged: (valor) {
                setState(() {
                  _quantidade = valor;
                });
              },
            ),
            const SizedBox(height: 8),
            const Text('Tipo de entrega'),
            RadioListTile<String>(
              title: const Text('Carreto'),
              value: 'Carreto',
              groupValue: _tipoEntrega,
              onChanged: (valor) {
                if (valor == null) return;
                setState(() {
                  _tipoEntrega = valor;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Retirada'),
              value: 'Retirada',
              groupValue: _tipoEntrega,
              onChanged: (valor) {
                if (valor == null) return;
                setState(() {
                  _tipoEntrega = valor;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Correio'),
              value: 'Correio',
              groupValue: _tipoEntrega,
              onChanged: (valor) {
                if (valor == null) return;
                setState(() {
                  _tipoEntrega = valor;
                });
              },
            ),
            const SizedBox(height: 8),
            const Text('Regiao'),
            DropdownButton<String>(
              value: _regiao,
              items: const [
                DropdownMenuItem(value: 'Norte', child: Text('Norte')),
                DropdownMenuItem(value: 'Nordeste', child: Text('Nordeste')),
                DropdownMenuItem(value: 'Centro-Oeste', child: Text('Centro-Oeste')),
                DropdownMenuItem(value: 'Sudeste', child: Text('Sudeste')),
                DropdownMenuItem(value: 'Sul', child: Text('Sul')),
              ],
              onChanged: (valor) {
                if (valor == null) return;
                setState(() {
                  _regiao = valor;
                });
              },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Aceito os termos e e-mail promocional'),
              value: _aceitaTermos,
              onChanged: (valor) {
                setState(() {
                  _aceitaTermos = valor ?? false;
                });
              },
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _cadastrar,
              child: const Text('Cadastrar'),
            ),
            const SizedBox(height: 16),
            Text(_resultado),
          ],
        ),
      ),
    );
  }
}
