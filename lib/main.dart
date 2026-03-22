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
  String _nomeProduto = "";
  double _quantidadeProduto = 20.0;
  String? _selectedEntrega = "";
  String _escolhaRegiao = "Escolha Região";
  bool _aceitaTermos = false;

  String _resultado = "";

  void _exibirDados() {
    setState(() {
      _resultado = "O produto selecionado foi: $_nomeProduto, mais a quantidade de produtos escolhido foi $_quantidadeProduto.O pedido será entregue via $_selectedEntrega. Já a região de entrega sera $_escolhaRegiao.O cliente aceita o envio de promoções: $_aceitaTermos";
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Olá Flutter')),
        body: Center(
          child: Column(
            children: [
              Text("Preenche com o nome do Produto"),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Digite seu nome',
                  border: OutlineInputBorder(),
                ),
                onChanged: (valor){
                  setState(() {
                    _nomeProduto = valor;
                  });
                },
              ),

              Text(
                'Defina Quantidade $_quantidadeProduto'
              ),

              Slider(
                value: _quantidadeProduto,
                min: 1,
                max: 100,
                label: _quantidadeProduto.round().toString(),
                onChanged: (double val) => setState(() => _quantidadeProduto = val.roundToDouble()),
              ),

              Text("Escolha o tipo de entrega"),

              Column(
                
                children: [
                  Radio<String>(
                    value: 'Carreto',
                    groupValue: _selectedEntrega,
                    onChanged: (val) => setState(() => _selectedEntrega = val)
                  ),
                  const Text('carreto'),

                  Radio<String>(
                    value: 'Retirada',
                    groupValue: _selectedEntrega,
                    onChanged: (val) => setState(() => _selectedEntrega = val),
                  ),
                  const Text("Retirada"),
                
                  Radio<String>(
                    value: 'Correio',
                    groupValue: _selectedEntrega,
                    onChanged: ( val) => setState(() => _selectedEntrega = val),
                  ),
                  const Text("Correio")
                ],
              ),

              Text("Escolha a região"),

              DropdownButton<String>(
                value: _escolhaRegiao,
                onChanged: (String? newValue) {
                  setState(() => _escolhaRegiao = newValue!);
                },
                items: <String>['São Paulo', 'Rio de Janeiro', 'Bahia', 'Escolha Região']
                    .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    })
                    .toList(),
              ),

              Text("Deseja receber promoções via e-mail?"),

              Row(
                children: [
                  Checkbox(
                    value: _aceitaTermos,                  
                    onChanged: (bool? value){
                      setState(() => _aceitaTermos = value!);
                    }
                  ),
                  Text("Sim, eu desejo receber promoções via e-mail.")
                ]
              ),

              ElevatedButton(
                onPressed: _exibirDados, 
                child: const Text('Cadastrar')
              ),

              Text(
                _resultado
              )

            ],
          ),
        ),
      ),
    );
  }
}
