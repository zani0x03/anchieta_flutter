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

  final TextEditingController _campoNome = TextEditingController();
  double _qtd = 1;
  String _tipoFrete = 'Carreto';
  String? _regiaoSelecionada;
  bool _receberEmail = false;
  String _resumo = '';

  final List<String> _listaRegioes = ['Centro', 'Norte', 'Sul', 'Leste', 'Oeste'];

  void _salvarCadastro() {
    String nome = _campoNome.text;
    _campoNome.clear();
    setState(() {
      _resumo = 'Produto: $nome';
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

            const Text('Nome do produto:'),
            TextField(
              controller: _campoNome,
              decoration: const InputDecoration(
                hintText: 'Insira o nome do produto',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            Text('Quantidade: ${_qtd.toInt()}'),
            Slider(
              value: _qtd,
              min: 1,
              max: 100,
              divisions: 99,
              label: _qtd.toInt().toString(),
              onChanged: (value) {
                setState(() { _qtd = value; });
              },
            ),

            const SizedBox(height: 20),

            const Text('Tipo de entrega:'),
            RadioListTile<String>(
              title: const Text('Carreto'),
              value: 'Carreto',
              groupValue: _tipoFrete,
              onChanged: (value) {
                setState(() { _tipoFrete = value!; });
              },
            ),
            RadioListTile<String>(
              title: const Text('Retirada'),
              value: 'Retirada',
              groupValue: _tipoFrete,
              onChanged: (value) {
                setState(() { _tipoFrete = value!; });
              },
            ),
            RadioListTile<String>(
              title: const Text('Correio'),
              value: 'Correio',
              groupValue: _tipoFrete,
              onChanged: (value) {
                setState(() { _tipoFrete = value!; });
              },
            ),

            const SizedBox(height: 20),

            const Text('Região:'),
            DropdownButton<String>(
              value: _regiaoSelecionada,
              hint: const Text('Selecione...'),
              isExpanded: true,
              items: _listaRegioes.map((String r) {
                return DropdownMenuItem<String>(
                  value: r,
                  child: Text(r),
                );
              }).toList(),
              onChanged: (value) {
                setState(() { _regiaoSelecionada = value; });
              },
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Checkbox(
                  value: _receberEmail,
                  onChanged: (value) {
                    setState(() { _receberEmail = value!; });
                  },
                ),
                const Text('Aceito receber e-mails com promoções.'),
              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _salvarCadastro,
              child: const Text('Cadastrar'),
            ),

            const SizedBox(height: 20),

            if (_resumo.isNotEmpty)
              Text(_resumo),

          ],
        ),
      ),
    );
  }
}