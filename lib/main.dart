import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String produto = '';
  double quantidade = 0;
  String entrega = 'Correio';
  String regiao = 'Centro';
  bool receberEmail = false;
  String resultado = '';

  void cadastrar() {
    setState(() {
      resultado =
          'O produto selecionado foi: $produto, mas a quantidade de produtos escolhida foi ${quantidade.toInt()}. '
          'O pedido será entregue via $entrega. Já a região de entrega escolhida foi $regiao. '
          'O cliente aceita o envio de promoções: ${receberEmail ? "Sim" : "Não"}.';
    });
  }

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
              onChanged: (value) {
                setState(() {
                  produto = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text('Defina a quantidade:'),
            Slider(
              value: quantidade,
              min: 0,
              max: 100,
              divisions: 20,
              label: quantidade.toInt().toString(),
              onChanged: (value) {
                setState(() {
                  quantidade = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text('Escolha o tipo de entrega:'),
            RadioListTile<String>(
              title: const Text('Carreto'),
              value: 'Carreto',
              groupValue: entrega,
              onChanged: (value) {
                setState(() {
                  entrega = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Retirada'),
              value: 'Retirada',
              groupValue: entrega,
              onChanged: (value) {
                setState(() {
                  entrega = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Correio'),
              value: 'Correio',
              groupValue: entrega,
              onChanged: (value) {
                setState(() {
                  entrega = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text('Escolha a região:'),
            DropdownButton<String>(
              value: regiao,
              items: const [
                DropdownMenuItem(value: 'Centro', child: Text('Centro')),
                DropdownMenuItem(value: 'Leste', child: Text('Leste')),
                DropdownMenuItem(value: 'Oeste', child: Text('Oeste')),
              ],
              onChanged: (value) {
                setState(() {
                  regiao = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text('Deseja receber promoções via e-mail?'),
            CheckboxListTile(
              title: const Text('Sim, eu desejo receber promoções via e-mail.'),
              value: receberEmail,
              onChanged: (value) {
                setState(() {
                  receberEmail = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: cadastrar,
                child: const Text('Cadastrar'),
              ),
            ),
            const SizedBox(height: 20),
            Text(resultado),
          ],
        ),
      ),
    );
  }
}