import 'package:flutter/material.dart';

const String tipoCarreto = 'Carreto';
const String tipoRetirada = 'Retirada';
const String tipoCorreio = 'Correio';
const String tituloPagina = 'Cadastro de Produto';
const String labelNomeProduto = 'Nome do produto';
const String labelRegiao = 'Região';
const String labelAceite = 'Aceito os termos e receber e-mail';
const String textoCadastrar = 'Cadastrar';
const List<String> regioes = [
  'Norte',
  'Nordeste',
  'Centro-Oeste',
  'Sudeste',
  'Sul',
];

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
  final TextEditingController _nomeProdutoController = TextEditingController();
  double _valorSlider = 1;
  String _tipoSelecionado = tipoRetirada;
  String _regiaoSelecionada = regioes.first;
  bool _aceitaTermosEmail = false;
  String _resultado = '';

  @override
  void dispose() {
    _nomeProdutoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(tituloPagina)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nomeProdutoController,
                decoration: const InputDecoration(labelText: labelNomeProduto),
              ),
              const SizedBox(height: 16),
              const Text('Quantidade'),
              Slider(
                value: _valorSlider,
                min: 1,
                max: 100,
                divisions: 10,
                label: _valorSlider.toStringAsFixed(0),
                onChanged: (valor) {
                  setState(() {
                    _valorSlider = valor;
                  });
                },
              ),
              RadioGroup<String>(
                groupValue: _tipoSelecionado,
                onChanged: (valor) {
                  if (valor == null) {
                    return;
                  }

                  setState(() {
                    _tipoSelecionado = valor;
                  });
                },
                child: const Column(
                  children: [
                    RadioListTile<String>(
                      title: Text(tipoCarreto),
                      value: tipoCarreto,
                    ),
                    RadioListTile<String>(
                      title: Text(tipoRetirada),
                      value: tipoRetirada,
                    ),
                    RadioListTile<String>(
                      title: Text(tipoCorreio),
                      value: tipoCorreio,
                    ),
                  ],
                ),
              ),
              DropdownButtonFormField<String>(
                initialValue: _regiaoSelecionada,
                decoration: const InputDecoration(labelText: labelRegiao),
                items: regioes
                    .map(
                      (regiao) => DropdownMenuItem<String>(
                        value: regiao,
                        child: Text(regiao),
                      ),
                    )
                    .toList(),
                onChanged: (valor) {
                  if (valor == null) {
                    return;
                  }

                  setState(() {
                    _regiaoSelecionada = valor;
                  });
                },
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text(labelAceite),
                value: _aceitaTermosEmail,
                onChanged: (valor) {
                  setState(() {
                    _aceitaTermosEmail = valor ?? false;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  final nomeProduto = _nomeProdutoController.text.trim();

                  if (nomeProduto.isEmpty) {
                    setState(() {
                      _resultado = 'Digite o nome do produto.';
                    });
                    return;
                  }

                  setState(() {
                    _resultado =
                        'Resumo do cadastro:\n'
                        'Produto: $nomeProduto\n'
                        'Quantidade: ${_valorSlider.toStringAsFixed(0)}\n'
                        'Tipo de entrega: $_tipoSelecionado\n'
                        'Região: $_regiaoSelecionada\n'
                        'Termos/E-mail: ${_aceitaTermosEmail ? 'Aceito' : 'Não aceito'}';
                    _nomeProdutoController.clear();
                  });
                },
                child: const Text(textoCadastrar),
              ),
              const SizedBox(height: 16),
              Text(_resultado),
            ],
          ),
        ),
      ),
    );
  }
}
