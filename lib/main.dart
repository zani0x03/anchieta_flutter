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
  TextEditingController produtoController = TextEditingController();

  double quantidade = 0; // valor do slider

  String? opcaoSelecionada;
  // variável para armazenar a opção selecionada
  String? regiaoSelecionada;

  bool isChecked = false; // variável para armazenar a região selecionada

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Olá Flutter')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: produtoController,
                decoration: InputDecoration(labelText: 'Produto'),
              ),

              SizedBox(height: 20),

              Text('Defina a quantidade'),

              Slider(
                value: quantidade,
                min: 0,
                max: 100,
                divisions: 100,
                label: quantidade.toStringAsFixed(0),
                onChanged: (double valor) {
                  setState(() {
                    quantidade = valor;
                  });
                },
              ),

              Text('Escolha o tipo de entrega'),

              RadioMenuButton(
                value: 'Correio',
                groupValue: opcaoSelecionada,
                onChanged: (value) {
                  setState(() {
                    opcaoSelecionada = value;
                  });
                  // Lógica para lidar com a seleção da opção
                },
                child: Text('Correio'),
              ),

              RadioMenuButton(
                value: 'Carreto',
                groupValue: opcaoSelecionada,
                onChanged: (value) {
                  setState(() {
                    opcaoSelecionada = value;
                  });
                  // Lógica para lidar com a seleção da opção
                },
                child: Text('Carreto'),
              ),

              RadioMenuButton(
                value: 'Retirada',
                groupValue: opcaoSelecionada,
                onChanged: (value) {
                  setState(() {
                    opcaoSelecionada = value;
                  });
                  // Lógica para lidar com a seleção da opção
                },
                child: Text('Retirada'),
              ),

              Text('Escolha sua Região'),

              DropdownButton<String>(
                value: regiaoSelecionada,
                onChanged: (String? newValue) {
                  setState(() {
                    regiaoSelecionada = newValue;
                  });
                },
                items: <String>['Norte', 'Sul', 'Leste', 'Oeste']
                    .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    })
                    .toList(),
              ),

              Text('Deseja receber promoçoẽs via e-mail?'),

              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),

              SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: () {
                  String produto = produtoController.text;

                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Dados cadastrados'),
                        content: Text(
                          'Produto: $produto\n'
                          'Quantidade: ${quantidade.toStringAsFixed(0)}\n'
                          'Entrega: $opcaoSelecionada\n'
                          'Região: $regiaoSelecionada\n'
                          'Aceitou receber promoçoẽs: ${isChecked ? "Sim" : "Não"}',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Cadastrar', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
