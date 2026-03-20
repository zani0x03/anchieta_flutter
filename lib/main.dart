import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
        scaffoldBackgroundColor: const Color(0xFFF3EEF7),
      ),
      home: const TelaCadastro(),
    );
  }
}

enum TipoEntrega { carreto, retirada, correio }

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController _produtoController = TextEditingController();

  double _quantidade = 0;
  TipoEntrega _tipoEntrega = TipoEntrega.correio;
  String _regiao = 'Centro';
  bool _receberPromocoes = false;
  bool _formularioSubmetido = false;

  @override
  void dispose() {
    _produtoController.dispose();
    super.dispose();
  }

  String _getNomeTipoEntrega(TipoEntrega tipo) {
    switch (tipo) {
      case TipoEntrega.carreto:
        return 'Carreto';
      case TipoEntrega.retirada:
        return 'Retirada';
      case TipoEntrega.correio:
        return 'Correio';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olá Flutter'),
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
        foregroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(14, 24, 14, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Preenche com o nome do Produto:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _produtoController,
              decoration: const InputDecoration(
                labelText: 'Produto',
                suffixIcon: Icon(Icons.assignment_outlined),
              ),
            ),
            const SizedBox(height: 36),
            const Text(
              'Defina a quantidade:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            Slider(
              value: _quantidade,
              min: 0,
              max: 100,
              divisions: 100,
              onChanged: (novoValor) {
                setState(() {
                  _quantidade = novoValor;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Escolha o tipo de entrega:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            RadioListTile<TipoEntrega>(
              value: TipoEntrega.carreto,
              groupValue: _tipoEntrega,
              title: const Text('Carreto'),
              onChanged: (valor) {
                if (valor == null) return;
                setState(() {
                  _tipoEntrega = valor;
                });
              },
              contentPadding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
            ),
            RadioListTile<TipoEntrega>(
              value: TipoEntrega.retirada,
              groupValue: _tipoEntrega,
              title: const Text('Retirada'),
              onChanged: (valor) {
                if (valor == null) return;
                setState(() {
                  _tipoEntrega = valor;
                });
              },
              contentPadding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
            ),
            RadioListTile<TipoEntrega>(
              value: TipoEntrega.correio,
              groupValue: _tipoEntrega,
              title: const Text('Correio'),
              onChanged: (valor) {
                if (valor == null) return;
                setState(() {
                  _tipoEntrega = valor;
                });
              },
              contentPadding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
            ),
            const SizedBox(height: 24),
            const Text(
              'Escolha a região:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Center(
              child: DropdownButton<String>(
                value: _regiao,
                onChanged: (valor) {
                  if (valor == null) return;
                  setState(() {
                    _regiao = valor;
                  });
                },
                items: const [
                  DropdownMenuItem(value: 'Centro', child: Text('Centro')),
                  DropdownMenuItem(value: 'Norte', child: Text('Norte')),
                  DropdownMenuItem(value: 'Sul', child: Text('Sul')),
                  DropdownMenuItem(value: 'Leste', child: Text('Leste')),
                  DropdownMenuItem(value: 'Oeste', child: Text('Oeste')),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'Deseja receber promoções via e-mail?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            CheckboxListTile(
              value: _receberPromocoes,
              onChanged: (valor) {
                setState(() {
                  _receberPromocoes = valor ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text(
                'Sim, eu desejo receber promoções via e-mail.',
                style: TextStyle(fontSize: 11),
              ),
              contentPadding: EdgeInsets.zero,
              dense: true,
            ),
            const SizedBox(height: 18),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _formularioSubmetido = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  elevation: 6,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  shape: const StadiumBorder(),
                  backgroundColor: const Color(0xFF55757E),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Cadastrar'),
              ),
            ),
            if (_formularioSubmetido) ...[
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Dados Cadastrados:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _CampoExibicao(
                      label: 'Produto',
                      valor: _produtoController.text,
                    ),
                    _CampoExibicao(
                      label: 'Quantidade',
                      valor: _quantidade.toStringAsFixed(0),
                    ),
                    _CampoExibicao(
                      label: 'Tipo de Entrega',
                      valor: _getNomeTipoEntrega(_tipoEntrega),
                    ),
                    _CampoExibicao(
                      label: 'Região',
                      valor: _regiao,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _CampoExibicao extends StatelessWidget {
  final String label;
  final String valor;

  const _CampoExibicao({
    required this.label,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          Text(
            valor,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}