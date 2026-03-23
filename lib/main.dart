import 'package:anchieta_flutter/entrada/checkbox.dart';
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
  String nomeProduto = "";
  double quantidade = 0;
  String tipoEntrega = "Carreto";
  String regiao = "Sudeste";
  bool aceitaEmail = false;
  String resultado = "";
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de produto')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: "Nome do produto"),
              onChanged: (valor) {
                setState(() {
                  nomeProduto = valor;
                });
              },
            ),

            Text("Quantidade: ${quantidade.toInt()}"),

            Slider(
              value: quantidade,
              min: 0,
              max: 100,
              onChanged: (valor) {
                setState(() {
                  quantidade = valor;
                });
              },
            ),
            RadioListTile(
              title: const Text("Carreto"),
              value: "Carreto",
              groupValue: tipoEntrega,
              onChanged: (valor) {
                setState(() {
                  tipoEntrega = valor!;
                });
              },
            ),
            RadioListTile(
              title: const Text("Retirada"),
              value: "Retirada",
              groupValue: tipoEntrega,
              onChanged: (valor) {
                setState(() {
                  tipoEntrega = valor!;
                });
              },
            ),
            RadioListTile(
              title: const Text("Correio"),
              value: "Correio",
              groupValue: tipoEntrega,
              onChanged: (valor) {
                setState(() {
                  tipoEntrega = valor!;
                });
              },
            ),
            DropdownButton<String>(
              value: regiao,
              items: const [
                DropdownMenuItem(value: "Norte", child: Text("Norte")),
                DropdownMenuItem(value: "Nordeste", child: Text("Nordeste")),
                DropdownMenuItem(value: "Sudeste", child: Text("Sudeste")),
                DropdownMenuItem(value: "Sul", child: Text("Sul")),
              ],
              onChanged: (valor) {
                setState(() {
                  regiao = valor!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Aceito receber e-mails"),
              value: aceitaEmail,
              onChanged: (valor) {
                setState(() {
                  aceitaEmail = valor!;
                });
              },
            ),
            ElevatedButton(
              child: const Text("Cadastrar"),
              onPressed: () {
                setState(() {
                  controller.clear();
                  resultado =
                      "Produto: $nomeProduto | Quantidade: ${quantidade.toInt()} | Entrega: $tipoEntrega | Região: $regiao";
                });
              },
            ),
            Text(resultado),
          ],
        ),
      ),
    );
  }
}
