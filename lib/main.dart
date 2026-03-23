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

  TextEditingController nomeController = TextEditingController();
  double quantidade = 1;
  String entrega = 'Carreto';
  String? regiao;
  bool aceitou = false;
  String resultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text('Nome do produto:'),
            TextField(
              controller: nomeController,
            ),

            SizedBox(height: 10),

            Text('Quantidade: ${quantidade.round()}'),
            Slider(
              value: quantidade,
              min: 1,
              max: 100,
              onChanged: (v) {
                setState(() {
                  quantidade = v;
                });
              },
            ),

            SizedBox(height: 10),

            Text('Tipo de entrega:'),
            Row(
              children: [
                Radio<String>(
                  value: 'Carreto',
                  groupValue: entrega,
                  onChanged: (v) {
                    setState(() {
                      entrega = v!;
                    });
                  },
                ),
                Text('Carreto'),
                Radio<String>(
                  value: 'Retirada',
                  groupValue: entrega,
                  onChanged: (v) {
                    setState(() {
                      entrega = v!;
                    });
                  },
                ),
                Text('Retirada'),
                Radio<String>(
                  value: 'Correio',
                  groupValue: entrega,
                  onChanged: (v) {
                    setState(() {
                      entrega = v!;
                    });
                  },
                ),
                Text('Correio'),
              ],
            ),

            SizedBox(height: 10),

            Text('Região:'),
            DropdownButton<String>(
              value: regiao,
              hint: Text('Selecione'),
              items: [
                DropdownMenuItem(value: 'Norte', child: Text('Norte')),
                DropdownMenuItem(value: 'Sul', child: Text('Sul')),
                DropdownMenuItem(value: 'Leste', child: Text('Leste')),
                DropdownMenuItem(value: 'Oeste', child: Text('Oeste')),
                DropdownMenuItem(value: 'Centro', child: Text('Centro')),
              ],
              onChanged: (v) {
                setState(() {
                  regiao = v;
                });
              },
            ),

            SizedBox(height: 10),

            Row(
              children: [
                Checkbox(
                  value: aceitou,
                  onChanged: (v) {
                    setState(() {
                      aceitou = v!;
                    });
                  },
                ),
                Text('Aceito receber promoções por e-mail'),
              ],
            ),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                String nome = nomeController.text;
                setState(() {
                  resultado = 'Produto: $nome | Quantidade: ${quantidade.round()} | Entrega: $entrega | Região: ${regiao ?? "Não selecionada"} | Promoções: ${aceitou ? "Sim" : "Não"}';
                  nomeController.clear();
                });
              },
              child: Text('Cadastrar'),
            ),

            SizedBox(height: 10),

            Text(resultado),

          ],
        ),
      ),
    );
  }
}