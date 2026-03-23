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

double qtd = 0;
enum Entrega { carreto, retirada, correio }

class _MyHomePageState extends State<MyHomePage> {

  double qtd = 0;
  String? regiao;
  String produto = '';
  Entrega? entrega = Entrega.carreto;
  bool check = false;
  String resumo = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Olá Flutter')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(decoration: InputDecoration(labelText: 'Nome do Produto'),
                onChanged: (valor) {
                  setState(() {
                    produto = valor;
                  });
                },
              ),
              Column (
                children: [
                  Text('Quantidade: ${qtd.toInt()}'),
                  Slider(value: qtd, min: 0, max: 10, 
                    onChanged: (valor) {
                      setState(() {
                        qtd = valor;
                      });
                    },
                  ),

                  Text('Tipo de entrega'),
                  RadioGroup<Entrega>(
                    groupValue: entrega,
                    onChanged: (valor){
                      setState(() {
                        entrega = valor;
                      });
                    },
                    child: Column(
                      children: [
                        RadioListTile<Entrega>(
                          value: Entrega.carreto,
                          title: Text('Carreto'),
                        ),
                        RadioListTile<Entrega>(
                          value: Entrega.retirada,
                          title: Text('Retirada'),
                        ),
                        RadioListTile<Entrega>(
                          value: Entrega.correio,
                          title: Text('Correios'),
                        ),
                      ],
                    ),
                  ),
                  DropdownButton<String>(
                    value: regiao,
                    hint: Text('Selecione a região'),
                    items: ['Norte', 'Nordeste', 'Centro-Oeste', 'Sudeste', 'Sul']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e),)).toList(),
                        onChanged: (valor){
                          setState(() {
                            regiao = valor;
                          });
                        },
                  ),
                ],
              ),
              Text('Aceito os termos'),
              Checkbox(
                value: check, 
                onChanged: (valor){
                  setState(() {
                    check = true;
                  });
                }),
              ElevatedButton(onPressed: (){
                setState(() {
                  resumo = 
                  'Produto: $produto\n'
                  'Quantidade: ${qtd.toInt()}\n'
                  'Entrega: $entrega\n'
                  'Região: $regiao';
                });
              }, child: Text('Cadastrar'),),
              Text(resumo)
            ],
          ),
        ),
      ),
    );
  }
}
