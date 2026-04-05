import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:anchieta_flutter/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController produtoController = TextEditingController();

  double quantidade = 1;
  String entrega = "Carreto";
  String? regiao;
  bool aceitaEmail = false;

  String resumo = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Olá Flutter"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Column(
              children: [
                const Text("Preenche com o Nome do Produto"),
                TextField(
                  controller: produtoController,
                  decoration: const InputDecoration(
                    labelText: "Produto",
                  ),
                ),
              ],
            ),

            Column(
              children: [
                const Text("Defina a quantidade:"),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.indigo[500],
                    inactiveTrackColor: Colors.indigo[100],
                    thumbColor: Colors.indigo[700],
                  ),
                  child: Slider(
                    value: quantidade,
                    min: 1,
                    max: 100,
                    divisions: 100,
                    label: quantidade.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        quantidade = value;
                      });
                    },
                  ),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Escolha o tipo de entrega:"),
                RadioListTile(
                  title: const Text("Carreto"),
                  value: "Carreto",
                  groupValue: entrega,
                  activeColor: Colors.amber[300],
                  onChanged: (value) {
                    setState(() {
                      entrega = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Retirada"),
                  value: "Retirada",
                  groupValue: entrega,
                  activeColor: Colors.amber[300],
                  onChanged: (value) {
                    setState(() {
                      entrega = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Correio"),
                  value: "Correio",
                  groupValue: entrega,
                  activeColor: Colors.amber[300],
                  onChanged: (value) {
                    setState(() {
                      entrega = value!;
                    });
                  },
                ),
              ],
            ),

            Column(
              children: [
                const Text("Escolha a região:"),
                DropdownButton<String>(
                  value: regiao,
                  hint: const Text("Selecione"),
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(value: "Centro", child: Text("Centro")),
                    DropdownMenuItem(value: "Norte", child: Text("Norte")),
                    DropdownMenuItem(value: "Sul", child: Text("Sul")),
                    DropdownMenuItem(value: "Leste", child: Text("Leste")),
                    DropdownMenuItem(value: "Oeste", child: Text("Oeste")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      regiao = value;
                    });
                  },
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Deseja receber promoções via e-mail"),
                Row(
                  children: [
                    Checkbox(
                      value: aceitaEmail,
                      activeColor: Colors.green[300],
                      onChanged: (value) {
                        setState(() {
                          aceitaEmail = value!;
                        });
                      },
                    ),
                    const Text("Sim, eu desejo receber promoções via e-mail"),
                  ],
                ),
              ],
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  resumo =
                      "Produto: ${produtoController.text}\n"
                      "Quantidade: ${quantidade.round()}\n"
                      "Entrega: $entrega\n"
                      "Região: ${regiao ?? "Não selecionada"}\n"
                      "Promoções: ${aceitaEmail ? "Sim" : "Não"}";
                });
              },
              child: const Text("Cadastrar"),
            ),
          ],
        ),
      ),
    );
  }
}

//eu nao entendi muito como fazer algumas coisas funcionarem direito aqui,
//entao fiz no dart pra poder funcionar mas não deu certo ainda