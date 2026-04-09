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
      home: MyHomePage(),
    );
  }
}

enum TipoEntrega { carreto, retirada, correio }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nomeController = TextEditingController();

  double _quantidade = 1;
  TipoEntrega _tipoEntrega = TipoEntrega.carreto;
  String? _regiao;
  bool _aceite = false;

  bool _mostrarResumo = false;
  String _resumo = '';

  final List<String> _regioes = const [
    'Norte',
    'Nordeste',
    'Centro-Oeste',
    'Sudeste',
    'Sul',
  ];

  String _tipoEntregaTexto(TipoEntrega tipo) {
    switch (tipo) {
      case TipoEntrega.carreto:
        return 'Carreto';
      case TipoEntrega.retirada:
        return 'Retirada';
      case TipoEntrega.correio:
        return 'Correio';
    }
  }

void _cadastrar() {
  final nome = _nomeController.text.trim();

  setState(() {
    _mostrarResumo = true;
    _resumo =
        'Produto: ${nome.isEmpty ? '-' : nome}\n'
        'Quantidade: ${_quantidade.round()}\n'
        'Entrega: ${_tipoEntregaTexto(_tipoEntrega)}\n'
        'Região: ${_regiao ?? '-'}\n'
        'Aceite: ${_aceite ? 'Sim' : 'Não'}';
  });
}

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
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
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do produto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Text('Quantidade: ${_quantidade.round()}'),
            Slider(
              value: _quantidade,
              min: 1,
              max: 100,
              divisions: 99,
              onChanged: (value) => setState(() => _quantidade = value),
            ),
            const SizedBox(height: 8),
            const Text('Tipo de entrega'),
            RadioListTile<TipoEntrega>(
              title: const Text('Carreto'),
              value: TipoEntrega.carreto,
              groupValue: _tipoEntrega,
              onChanged: (value) {
                if (value != null) setState(() => _tipoEntrega = value);
              },
            ),
            RadioListTile<TipoEntrega>(
              title: const Text('Retirada'),
              value: TipoEntrega.retirada,
              groupValue: _tipoEntrega,
              onChanged: (value) {
                if (value != null) setState(() => _tipoEntrega = value);
              },
            ),
            RadioListTile<TipoEntrega>(
              title: const Text('Correio'),
              value: TipoEntrega.correio,
              groupValue: _tipoEntrega,
              onChanged: (value) {
                if (value != null) setState(() => _tipoEntrega = value);
              },
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _regiao,
              decoration: const InputDecoration(
                labelText: 'Região',
                border: OutlineInputBorder(),
              ),
              items: _regioes
                  .map((r) => DropdownMenuItem<String>(value: r, child: Text(r)))
                  .toList(),
              onChanged: (value) => setState(() => _regiao = value),
            ),
            const SizedBox(height: 8),
            CheckboxListTile(
              value: _aceite,
              title: const Text('Aceito os termos e receber e-mail'),
              contentPadding: EdgeInsets.zero,
              onChanged: (value) => setState(() => _aceite = value ?? false),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _cadastrar,
                child: const Text('Cadastrar'),
              ),
            ),
            if (_mostrarResumo) ...[
              const SizedBox(height: 16),
              Text(_resumo),
            ],
          ],
        ),
      ),
    );
  }
}