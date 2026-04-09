import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) => const MaterialApp(home: MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _nomeController = TextEditingController();
  double _quantidade = 1;
  String _tipoEntrega = 'Carreto';
  String? _regiao;
  bool _aceitaEmail = false;
  String _resultado = '';

  void _cadastrar() => setState(() {
    _resultado = 'Produto: ${_nomeController.text} | '
        'Quantidade: ${_quantidade.round()} | '
        'Entrega: $_tipoEntrega | '
        'Região: ${_regiao ?? "Não informada"} | '
        'E-mail: ${_aceitaEmail ? "Sim" : "Não"}';
  });

  Widget _radio(String label) => RadioListTile<String>(
    title: Text(label),
    value: label,
    groupValue: _tipoEntrega,
    onChanged: (v) => setState(() => _tipoEntrega = v!),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Produto')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nome do Produto'),
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                hintText: 'Digite o nome do produto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Text('Quantidade: ${_quantidade.round()}'),
            Slider(
              value: _quantidade, min: 1, max: 100, divisions: 99,
              label: _quantidade.round().toString(),
              onChanged: (v) => setState(() => _quantidade = v),
            ),
            const SizedBox(height: 16),
            const Text('Tipo de Entrega'),
            _radio('Carreto'), _radio('Retirada'), _radio('Correio'),
            const SizedBox(height: 16),
            const Text('Região'),
            DropdownButtonFormField<String>(
              value: _regiao,
              hint: const Text('Selecione a região'),
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: ['Norte', 'Sul', 'Leste', 'Oeste', 'Centro']
                  .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                  .toList(),
              onChanged: (v) => setState(() => _regiao = v),
            ),
            const SizedBox(height: 16),
            Row(children: [
              Checkbox(
                value: _aceitaEmail,
                onChanged: (v) => setState(() => _aceitaEmail = v!),
              ),
              const Expanded(child: Text('Aceito receber promoções por e-mail')),
            ]),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _cadastrar,
                child: const Text('Cadastrar'),
              ),
            ),
            const SizedBox(height: 24),
            if (_resultado.isNotEmpty)
              Text(_resultado, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}