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
  final inputNome = TextEditingController();
  double numQtd = 3;
  String tipoEntrega = 'Carreto';
  String cidadeReg = 'Norte';
  bool aceitouEmail = false;
  String textoRes = '';
  bool erroNome = false; // flag pra mostrar erro quando nome ta vazio

  // regioes que o sistema atende por enquanto
  final regioes = ['Norte', 'Sul', 'Leste', 'Oeste', 'Centro'];

  void confirmarCadastro() {
    // nao deixa salvar sem preencher o nome
    if (inputNome.text.trim().isEmpty) {
      setState(() {
        erroNome = true;
        textoRes = '';
      });
      return;
    }

    String marcouEmail = aceitouEmail ? 'Sim' : 'Não';
    int qtdFinal = numQtd.round();

    // tudo ok, monta o texto de confirmacao
    setState(() {
      erroNome = false;
      textoRes = 'Produto: ${inputNome.text} | Qtd: $qtdFinal | Frete: $tipoEntrega | Local: $cidadeReg | Contato: $marcouEmail';
    });
  }

  Widget _inputProduto() {
    return TextField(
      controller: inputNome,
      decoration: InputDecoration(
        labelText: 'Produto',
        hintText: 'Ex: Camiseta tamanho M',
        border: const OutlineInputBorder(),
        errorText: erroNome ? 'Preencha o nome do produto' : null,
      ),
    );
  }

  // separei o slider aqui pq ficava grande demais no build
  Widget _sliderDeQtd() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quantidade: ${ numQtd.round()}'),
        Slider(
          value: numQtd,
          min: 1, max: 100,
          divisions: 99,
          label: numQtd.round().toString(),
          onChanged: (x) {
            setState(() {
              numQtd = x;
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final corPrincipal = const Color(0xFFFF9800);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Produto'),
        backgroundColor: corPrincipal,
        foregroundColor: Colors.white,
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

            _inputProduto(),
            const SizedBox(height: 20),
            _sliderDeQtd(),
            const SizedBox(height: 12),

            const Text('Região de entrega:'),
            const SizedBox(height: 4),
            DropdownButton<String>(
              value: cidadeReg,
              isExpanded: true,
              items: regioes.map((r) {
                return DropdownMenuItem(value: r, child: Text(r));
              }).toList(),
              onChanged: (escolheu) {
                cidadeReg = escolheu!;
                setState(() {});
              },
            ),

            const SizedBox(height: 14),
            const Text('Forma de entrega:'),
            RadioListTile<String>(
              title: const Text('Carreto'),
              value: 'Carreto',
              groupValue: tipoEntrega,
              onChanged: (op) {
                setState(() { tipoEntrega = op!; });
              },
            ),
            RadioListTile<String>(
              title: const Text('Retirada'),
              value: 'Retirada',
              groupValue: tipoEntrega,
              onChanged: (op) {
                setState(() { tipoEntrega = op!; });
              },
            ),
            RadioListTile<String>(
              title: const Text('Correio'),
              value: 'Correio',
              groupValue: tipoEntrega,
              onChanged: (op) {
                setState(() { tipoEntrega = op!; });
              },
            ),

            const SizedBox(height: 6),
            Row(
              children: [
                Checkbox(
                  value: aceitouEmail,
                  onChanged: (marcou) {
                    aceitouEmail = marcou!;
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
                onPressed: confirmarCadastro,
                style: ElevatedButton.styleFrom(
                  backgroundColor: corPrincipal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                ),
                child: const Text('Cadastrar'),
              ),
            ),

            const SizedBox(height: 20),
            if (textoRes.isNotEmpty)
              Text(textoRes, style: const TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}