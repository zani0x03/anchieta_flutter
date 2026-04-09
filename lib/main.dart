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
  String nome = '';
  double qtd = 1;
  String entrega = 'Carreto';
  bool check = false;
  String textoFinal = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Olá Flutter')),
      body: Column(
        children: [
          TextField(
            onChanged: (valor) {
              nome = valor;
            },
          ),
          Slider(
            value: qtd,
            min: 1,
            max: 100,
            onChanged: (valor) {
              setState(() {
                qtd = valor;
              });
            },
          ),
          RadioListTile(
            title: const Text('Carreto'),
            value: 'Carreto',
            groupValue: entrega,
            onChanged: (valor) {
              setState(() {
                entrega = valor.toString();
              });
            },
          ),
          RadioListTile(
            title: const Text('Retirada'),
            value: 'Retirada',
            groupValue: entrega,
            onChanged: (valor) {
              setState(() {
                entrega = valor.toString();
              });
            },
          ),
          RadioListTile(
            title: const Text('Correio'),
            value: 'Correio',
            groupValue: entrega,
            onChanged: (valor) {
              setState(() {
                entrega = valor.toString();
              });
            },
          ),
          Checkbox(
            value: check,
            onChanged: (valor) {
              setState(() {
                check = valor!;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                textoFinal = 'Cadastrado com sucesso';
              });
            },
            child: const Text('Cadastrar'),
          ),
          Text(textoFinal),
        ],
      ),
    );
  }
}