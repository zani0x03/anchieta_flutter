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
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController nomeController = TextEditingController();

  double quantidade = 1;
  String tipoEntrega = 'Retirada';
  String regiao = 'Sudeste';
  bool aceitaEmail = false;
  String resultado = '';

  @override
  void dispose() {
    nomeController.dispose();
    super.dispose();
  }

  void cadastrarProduto() {
    String nome = nomeController.text.trim();

    if (nome.isEmpty) {
      setState(() {
        resultado = 'Digite o nome do produto.';
      });
      return;
    }

    setState(() {
      resultado =
          'Produto: $nome\n'
          'Quantidade: ${quantidade.toStringAsFixed(0)}\n'
          'Tipo de entrega: $tipoEntrega\n'
          'Região: $regiao\n'
          'Aceita receber e-mail: ${aceitaEmail ? 'Sim' : 'Não'}';

      nomeController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Produto'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do produto',
                ),
              ),
              const SizedBox(height: 20),

              const Text('Quantidade'),
              Slider(
                value: quantidade,
                min: 1,
                max: 100,
                divisions: 99,
                label: quantidade.toStringAsFixed(0),
                onChanged: (value) {
                  setState(() {
                    quantidade = value;
                  });
                },
              ),

              const SizedBox(height: 10),
              const Text('Tipo de entrega'),

              RadioGroup<String>(
                groupValue: tipoEntrega,
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }

                  setState(() {
                    tipoEntrega = value;
                  });
                },
                child: const Column(
                  children: [
                    RadioListTile<String>(
                      title: Text('Carreto'),
                      value: 'Carreto',
                    ),
                    RadioListTile<String>(
                      title: Text('Retirada'),
                      value: 'Retirada',
                    ),
                    RadioListTile<String>(
                      title: Text('Correio'),
                      value: 'Correio',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                initialValue: regiao,
                decoration: const InputDecoration(
                  labelText: 'Região',
                ),
                items: const [
                  DropdownMenuItem(value: 'Norte', child: Text('Norte')),
                  DropdownMenuItem(value: 'Nordeste', child: Text('Nordeste')),
                  DropdownMenuItem(
                    value: 'Centro-Oeste',
                    child: Text('Centro-Oeste'),
                  ),
                  DropdownMenuItem(value: 'Sudeste', child: Text('Sudeste')),
                  DropdownMenuItem(value: 'Sul', child: Text('Sul')),
                ],
                onChanged: (value) {
                  setState(() {
                    regiao = value!;
                  });
                },
              ),

              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Aceito os termos e desejo receber e-mail'),
                value: aceitaEmail,
                onChanged: (value) {
                  setState(() {
                    aceitaEmail = value ?? false;
                  });
                },
              ),

              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: cadastrarProduto,
                child: const Text('Cadastrar'),
              ),

              const SizedBox(height: 20),
              Text(
                resultado,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}