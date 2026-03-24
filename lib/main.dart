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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum TipoEntrega { carreto, retirada, correio }

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _produtoController = TextEditingController();

  double _quantidade = 1;
  TipoEntrega _tipoEntrega = TipoEntrega.correio;
  String _regiao = 'Centro';
  bool _receberEmail = false;

  String _resultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Olá Flutter')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Preenche com o nome do Produto:'),
            TextField(
              controller: _produtoController,
              decoration: const InputDecoration(
                labelText: 'Produto',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            const Text('Defina a quantidade:'),
            Slider(
              min: 0,
              max: 100,
              divisions: 100,
              value: _quantidade,
              onChanged: (value) {
                setState(() {
                  _quantidade = value;
                });
              },
            ),

            const SizedBox(height: 20),

            const Text('Escolha o tipo de entrega:'),
            RadioListTile<TipoEntrega>(
              title: const Text('Carreto'),
              value: TipoEntrega.carreto,
              groupValue: _tipoEntrega,
              onChanged: (value) {
                setState(() {
                  _tipoEntrega = value!;
                });
              },
            ),
            RadioListTile<TipoEntrega>(
              title: const Text('Retirada'),
              value: TipoEntrega.retirada,
              groupValue: _tipoEntrega,
              onChanged: (value) {
                setState(() {
                  _tipoEntrega = value!;
                });
              },
            ),
            RadioListTile<TipoEntrega>(
              title: const Text('Correio'),
              value: TipoEntrega.correio,
              groupValue: _tipoEntrega,
              onChanged: (value) {
                setState(() {
                  _tipoEntrega = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            const Text('Escolha a região:'),
            DropdownButton<String>(
              value: _regiao,
              isExpanded: true,
              items: ['Centro', 'Norte', 'Sul', 'Leste', 'Oeste']
                  .map((regiao) => DropdownMenuItem(
                        value: regiao,
                        child: Text(regiao),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _regiao = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            const Text('Deseja receber promoções via e-mail?'),
            Row(
              children: [
                Checkbox(
                  value: _receberEmail,
                  onChanged: (value) {
                    setState(() {
                      _receberEmail = value!;
                    });
                  },
                ),
                const Expanded(
                  child: Text(
                      'Sim, eu desejo receber promoções via e-mail.'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _resultado =
                        'Produto: ${_produtoController.text}\n'
                        'Quantidade: ${_quantidade.toInt()}\n'
                        'Entrega: ${_tipoEntrega.name}\n'
                        'Região: $_regiao\n'
                        'Promoções: ${_receberEmail ? "Sim" : "Não"}';
                  });
                },
                child: const Text('Cadastrar'),
              ),
            ),

            const SizedBox(height: 20),

            Text(_resultado),
          ],
        ),
      ),
    );
  }
}