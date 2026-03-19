import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Olá Flutter',
      home: const FormularioCadastro(),
    );
  }
}

class FormularioCadastro extends StatefulWidget {
  const FormularioCadastro({super.key});

  @override
  State<FormularioCadastro> createState() => _FormularioCadastroState();
}

class _FormularioCadastroState extends State<FormularioCadastro> {
  final TextEditingController _nomeController = TextEditingController();
  double _quantidade = 0;
  String _tipoEntrega = 'Carreto';
  String _regiao = 'Centro';
  bool _aceitaPromocoes = false;
  String _resumo = '';

  final List<String> _regioes = ['Centro', 'Norte', 'Sul', 'Leste', 'Oeste'];

  void _cadastrar() {
    setState(() {
      _resumo =
          'O produto selecionado foi: ${_nomeController.text}, '
          'mas a quantidade de produtos escolhida foi ${_quantidade.toInt()}. '
          'O pedido será entregue via $_tipoEntrega. '
          'Já a região de entrega será $_regiao. '
          'O cliente aceita o envio de promoções '
          '${_aceitaPromocoes ? 'Aceito' : 'Negado'}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Olá Flutter')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Preenche com o nome do Produto:'),
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(hintText: 'Produto'),
            ),

            const SizedBox(height: 24),

            const Text('Defina a quantidade:'),
            Slider(
              value: _quantidade,
              min: 0,
              max: 100,
              divisions: 100,
              label: _quantidade.toInt().toString(),
              onChanged: (valor) {
                setState(() => _quantidade = valor);
              },
            ),

            const SizedBox(height: 24),

            const Text('Escolha o tipo de entrega:'),
            for (final tipo in ['Carreto', 'Retirada', 'Correio'])
              RadioListTile<String>(
                title: Text(tipo),
                value: tipo,
                groupValue: _tipoEntrega,
                onChanged: (valor) {
                  setState(() => _tipoEntrega = valor!);
                },
              ),

            const SizedBox(height: 8),

            const Text('Escolha a região:'),
            DropdownButton<String>(
              value: _regiao,
              items: _regioes
                  .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                  .toList(),
              onChanged: (valor) {
                setState(() => _regiao = valor!);
              },
            ),

            const SizedBox(height: 8),

            const Text('Deseja receber promoções via e-mail?'),
            CheckboxListTile(
              title: const Text('Sim, eu desejo receber promoções via e-mail.'),
              value: _aceitaPromocoes,
              onChanged: (valor) {
                setState(() => _aceitaPromocoes = valor!);
              },
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _cadastrar,
              child: const Text('Cadastrar'),
            ),

            const SizedBox(height: 16),

            if (_resumo.isNotEmpty) Text(_resumo),
          ],
        ),
      ),
    );
  }
}