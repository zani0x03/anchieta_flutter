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
  final _nomeController = TextEditingController();
  double qtd = 1;
  String entrega = 'Carreto';
  String? regiao = 'Norte';
  bool receberEmail = false;
  String resultado = '';

  void cadastrar() {
    setState(() {
      resultado = 'Produto: ${_nomeController.text}\n'
        'Quantidade: ${qtd.round()}\n'
        'Entrega: $entrega\n'
        'Região: $regiao\n'
        'Aceita e-mail: ${receberEmail ? 'Sim' : 'Não'}';
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
            const Text('Nome do Produto:'),
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(hintText: 'Digite o nome do produto'),
            ),

            const SizedBox(height: 20),
            Text('Quantidade: ${qtd.round()}'),
            Slider(
              value: qtd,
              min: 1,
              max: 100,
              divisions: 99,
              label: qtd.round().toString(),
              onChanged: (val) {
                setState(() {
                  qtd = val;
                });
              },
            ),

            const SizedBox(height: 16),
            const Text('Tipo de Entrega:'),
            RadioListTile<String>(
              title: const Text('Carreto'),
              value: 'Carreto',
              groupValue: entrega,
              onChanged: (val) => setState(() => entrega = val!),
            ),
            RadioListTile<String>(
              title: const Text('Retirada'),
              value: 'Retirada',
              groupValue: entrega,
              onChanged: (val) => setState(() => entrega = val!),
            ),
            RadioListTile<String>(
              title: const Text('Correio'),
              value: 'Correio',
              groupValue: entrega,
              onChanged: (val) => setState(() => entrega = val!),
            ),

            const SizedBox(height: 16),
            const Text('Região:'),
            DropdownButton<String>(
              value: regiao,
              items: const [
                DropdownMenuItem(value: 'Norte', child: Text('Norte')),
                DropdownMenuItem(value: 'Sul', child: Text('Sul')),
                DropdownMenuItem(value: 'Leste', child: Text('Leste')),
                DropdownMenuItem(value: 'Oeste', child: Text('Oeste')),
              ],
              onChanged: (val) => setState(() => regiao = val),
            ),

            const SizedBox(height: 12),
            Row(
              children: [
                Checkbox(
                  value: receberEmail,
                  onChanged: (val) {
                    setState(() {
                      receberEmail = val!;
                    });
                  },
                ),
                const Text('Aceitar receber e-mails promocionais'),
              ],
            ),

            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: cadastrar,
                child: const Text('Cadastrar'),
              ),
            ),

            const SizedBox(height: 24),
            if (resultado.isNotEmpty)
              Text(resultado, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}