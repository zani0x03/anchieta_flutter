import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Produto',
      home: const ProdutoForm(),
    );
  }
}

class ProdutoForm extends StatefulWidget {
  const ProdutoForm({super.key});

  @override
  State<ProdutoForm> createState() => _ProdutoFormState();
}

class _ProdutoFormState extends State<ProdutoForm> {
  final TextEditingController _produtoController = TextEditingController();
  double _quantidade = 1;
  String _tipoEntrega = 'Correio';
  String _regiao = 'Centro';
  bool _promocoes = false;

  bool _mostrarResumo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Olá Flutter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Preencha com o nome do Produto:'),
              TextField(
                controller: _produtoController,
                decoration: const InputDecoration(labelText: 'Produto'),
              ),
              const SizedBox(height: 20),

              const Text('Defina a quantidade:'),
              Slider(
                value: _quantidade,
                min: 1,
                max: 10,
                divisions: 9,
                label: _quantidade.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _quantidade = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              const Text('Escolha o tipo de entrega:'),
              Column(
                children: [
                  RadioListTile(
                    title: const Text('Carreto'),
                    value: 'Carreto',
                    groupValue: _tipoEntrega,
                    onChanged: (value) {
                      setState(() {
                        _tipoEntrega = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Retirada'),
                    value: 'Retirada',
                    groupValue: _tipoEntrega,
                    onChanged: (value) {
                      setState(() {
                        _tipoEntrega = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Correio'),
                    value: 'Correio',
                    groupValue: _tipoEntrega,
                    onChanged: (value) {
                      setState(() {
                        _tipoEntrega = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text('Escolha a região:'),
              DropdownButton<String>(
                value: _regiao,
                items: const [
                  DropdownMenuItem(value: 'Centro', child: Text('Centro')),
                  DropdownMenuItem(value: 'Zona Norte', child: Text('Zona Norte')),
                  DropdownMenuItem(value: 'Zona Sul', child: Text('Zona Sul')),
                ],
                onChanged: (value) {
                  setState(() {
                    _regiao = value!;
                  });
                },
              ),
              const SizedBox(height: 20),

              CheckboxListTile(
                title: const Text('Sim, eu desejo receber promoções via e-mail.'),
                value: _promocoes,
                onChanged: (value) {
                  setState(() {
                    _promocoes = value!;
                  });
                },
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _mostrarResumo = true;
                  });
                },
                child: const Text('Cadastrar'),
              ),

              const SizedBox(height: 20),

              if (_mostrarResumo) ...[
                Text('Produto: ${_produtoController.text}'),
                Text('Quantidade: ${_quantidade.round()}'),
                Text('Entrega: $_tipoEntrega'),
                Text('Região: $_regiao'),
                Text('Promoções: ${_promocoes ? "Sim" : "Não"}'),
              ],
            ],
          ),
        ),
      ),
    );
  }
}