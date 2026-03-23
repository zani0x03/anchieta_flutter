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
  final TextEditingController controller = TextEditingController();

  double quantidade = 0;
  String entrega = 'Carreto';
  bool promocao = false;
  String resultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olá Flutter'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),

          Slider(
            value: quantidade,
            min: 0,
            max: 100,
            onChanged: (value) {
              setState(() {
                quantidade = value;
              });
            },
          ),

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

          Checkbox(
            value: promocao,
            onChanged: (value) {
              setState(() {
                promocao = value!;
              });
            },
          ),

          ElevatedButton(
            onPressed: () {
              setState(() {
                resultado = controller.text;
                controller.clear();
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