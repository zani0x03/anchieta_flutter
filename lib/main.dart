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
  double quantidade = 1;
  String entrega = 'Retirada';
  bool promocao = false;
  String resultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de produto')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: 'Nome do produto',
            ),
          ),

          Slider(
            value: quantidade,
            min: 1,
            max: 10,
            divisions: 9,
            label: quantidade.toInt().toString(),
            onChanged: (valor) {
              setState(() {
                quantidade = valor;
              });
            },
          ),

          RadioListTile(
            title: const Text('Retirada'),
            value: 'Retirada',
            groupValue: entrega,
            onChanged: (valor) {
              setState(() {
                entrega = valor!;
              });
            },
          ),
          RadioListTile(
            title: const Text('Carreto'),
            value: 'Carreto',
            groupValue: entrega,
            onChanged: (valor) {
              setState(() {
                entrega = valor!;
              });
            },
          ),
          RadioListTile(
            title: const Text('Correio'),
            value: 'Correio',
            groupValue: entrega,
            onChanged: (valor) {
              setState(() {
                entrega = valor!;
              });
            },
          ),

          Row(
            children: [
              const Text('Deseja receber promoções?'),
              Checkbox(
                value: promocao,
                onChanged: (valor) {
                  setState(() {
                    promocao = valor!;
                  });
                },
              ),
            ],
          ),

          ElevatedButton(
            onPressed: () {
              setState(() {
                resultado =
                    'Produto cadastrado com sucesso!\n'
                    'Quantidade: $quantidade\n'
                    'Entrega: $entrega\n'
                    'Promoções: ${promocao ? "Sim" : "Não"}';
              });
            },
            child: const Text('Cadastrar'),
          ),

          Text(resultado),
        ],
      ),
    );
  }
}