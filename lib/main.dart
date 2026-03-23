import 'package:flutter/material.dart';

void main() {
  runApp(const CadastroApp());
}

class CadastroApp extends StatelessWidget {
  const CadastroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cadastro de Produto',
      home: FormularioProduto(),
    );
  }
}

class FormularioProduto extends StatefulWidget {
  const FormularioProduto({super.key});

  @override
  State<FormularioProduto> createState() => _FormularioProdutoState();
}

class _FormularioProdutoState extends State<FormularioProduto> {
  final TextEditingController _nomeController = TextEditingController();
  double _qtdSelecionada = 1;
  String _opcaoEntrega = 'Correio';
  String _areaSelecionada = 'Centro';
  bool _aceitePromocoes = false;

  bool _exibirResumo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Produto')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nome do Produto:'),
              TextField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Produto',
                ),
              ),
              const SizedBox(height: 20),

              const Text('Quantidade:'),
              Slider(
                value: _qtdSelecionada,
                min: 1,
                max: 10,
                divisions: 9,
                label: _qtdSelecionada.round().toString(),
                onChanged: (valor) {
                  setState(() {
                    _qtdSelecionada = valor;
                  });
                },
              ),
              const SizedBox(height: 20),

              const Text('Tipo de entrega:'),
              Column(
                children: [
                  RadioListTile(
                    title: const Text('Carreto'),
                    value: 'Carreto',
                    groupValue: _opcaoEntrega,
                    onChanged: (valor) {
                      setState(() {
                        _opcaoEntrega = valor!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Retirada'),
                    value: 'Retirada',
                    groupValue: _opcaoEntrega,
                    onChanged: (valor) {
                      setState(() {
                        _opcaoEntrega = valor!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Correio'),
                    value: 'Correio',
                    groupValue: _opcaoEntrega,
                    onChanged: (valor) {
                      setState(() {
                        _opcaoEntrega = valor!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text('Região:'),
              DropdownButton<String>(
                value: _areaSelecionada,
                items: const [
                  DropdownMenuItem(value: 'Centro', child: Text('Centro')),
                  DropdownMenuItem(value: 'Zona Norte', child: Text('Zona Norte')),
                  DropdownMenuItem(value: 'Zona Sul', child: Text('Zona Sul')),
                ],
                onChanged: (valor) {
                  setState(() {
                    _areaSelecionada = valor!;
                  });
                },
              ),
              const SizedBox(height: 20),

              CheckboxListTile(
                title: const Text('Aceito receber promoções por e-mail'),
                value: _aceitePromocoes,
                onChanged: (valor) {
                  setState(() {
                    _aceitePromocoes = valor!;
                  });
                },
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _exibirResumo = true;
                  });
                },
                child: const Text('Cadastrar'),
              ),
              const SizedBox(height: 20),

              if (_exibirResumo) ...[
                Text('Produto: ${_nomeController.text}'),
                Text('Quantidade: ${_qtdSelecionada.round()}'),
                Text('Entrega: $_opcaoEntrega'),
                Text('Região: $_areaSelecionada'),
                Text('Promoções: ${_aceitePromocoes ? "Sim" : "Não"}'),
              ],
            ],
          ),
        ),
      ),
    );
  }
}