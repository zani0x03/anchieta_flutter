import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext ctx) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final campoProduto = TextEditingController();
  double qtdProduto = 0;
  String tipoFrete = 'Carreto';
  String regiaoCidade = 'Norte';
  bool querNewsletter = false;
  String resultado = '';
  bool campoVazio = false;

  final listaCidades = ['Norte', 'Sul', 'Leste', 'Oeste', 'Centro'];

  void salvarProduto() {
    if (campoProduto.text.trim().isEmpty) {
      setState(() {
        campoVazio = true;
        resultado = '';
      });
      return;
    }

    String email = querNewsletter ? 'Sim' : 'Não';
    int qtd = qtdProduto.round();

    setState(() {
      campoVazio = false;
      resultado = 'Produto: ${campoProduto.text} | Qtd: $qtd | Frete: $tipoFrete | Local: $regiaoCidade | Contato: $email';
    });
  }

  Widget campoNome() {
    return TextField(
      controller: campoProduto,
      decoration: InputDecoration(
        labelText: 'Produto',
        hintText: 'Ex: Ração tipo C',
        border: const OutlineInputBorder(),
        errorText: campoVazio ? 'Preencha o nome do produto' : null,
      ),
    );
  }

  Widget slidreQtd() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quantidade: ${qtdProduto.round()}'),
        Slider(
          value: qtdProduto,
          min: 0, max: 100,
          divisions: 99,
          label: qtdProduto.round().toString(),
          onChanged: (x) {
            setState(() {
              qtdProduto = x;
            });
          },
        ),
      ],
    );
  }

  
  @override
  Widget build(BuildContext context) {
    final cor = const Color.fromARGB(255, 238, 52, 52);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Produto'),
        backgroundColor: cor,
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text('Preencha os dados abaixo:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 15),

            campoNome(),
            const SizedBox(height: 20),
            slidreQtd(),
            const SizedBox(height: 12),

            const Text('Região de entrega:'),
            const SizedBox(height: 4),
            DropdownButton<String>(
              value: regiaoCidade,
              isExpanded: true,
              items: listaCidades.map((r) {
                return DropdownMenuItem(value: r, child: Text(r));
              }).toList(),
              onChanged: (escolheu) {
                regiaoCidade = escolheu!;
                setState(() {});
              },
            ),

            const SizedBox(height: 14),
            const Text('Forma de entrega:'),
            RadioListTile<String>(
              title: const Text('Motoboy'),
              value: 'Carreto',
              groupValue: tipoFrete,
              onChanged: (op) {
                setState(() { tipoFrete = op!; });
              },
            ),
            RadioListTile<String>(
              title: const Text('Retirada'),
              value: 'Retirada',
              groupValue: tipoFrete,
              onChanged: (op) {
                setState(() { tipoFrete = op!; });
              },
            ),
            RadioListTile<String>(
              title: const Text('Correio'),
              value: 'Correio',
              groupValue: tipoFrete,
              onChanged: (op) {
                setState(() { tipoFrete = op!; });
              },
            ),

            const SizedBox(height: 6),
            Row(
              children: [
                Checkbox(
                  value: querNewsletter,
                  onChanged: (marcou) {
                    querNewsletter = marcou!;
                    setState(() {});
                  },
                ),
                const Text('Concordo em receber novidades por e-mail'),
              ],
            ),

            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: salvarProduto,
                style: ElevatedButton.styleFrom(
                  backgroundColor: cor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                ),
                child: const Text('Cadastrar'),
              ),
            ),

            const SizedBox(height: 20),
            if (resultado.isNotEmpty)
              Text(resultado, style: const TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}