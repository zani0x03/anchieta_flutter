import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final TextEditingController controller = TextEditingController();
  double quantidade = 10;
  String tipoEntrega = 'Carreto';
  bool aceita = false;
  String textoFinal = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de Produto'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Campo de texto
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: 'Nome do produto',
                ),
              ),

              const SizedBox(height: 15),

              // Slider
              Slider(
                value: quantidade,
                min: 0,
                max: 100,
                onChanged: (value) {
                  setState(() {
                    quantidade = value;
                  });
                },
              ),

              const SizedBox(height: 15),

              // Radios
              RadioListTile(
                title: const Text('Carreto'),
                value: 'Carreto',
                groupValue: tipoEntrega,
                onChanged: (value) {
                  setState(() {
                    tipoEntrega = value!;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Retirada'),
                value: 'Retirada',
                groupValue: tipoEntrega,
                onChanged: (value) {
                  setState(() {
                    tipoEntrega = value!;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Correio'),
                value: 'Correio',
                groupValue: tipoEntrega,
                onChanged: (value) {
                  setState(() {
                    tipoEntrega = value!;
                  });
                },
              ),

              const SizedBox(height: 15),

              // Checkbox
              Row(
                children: [
                  Checkbox(
                    value: aceita,
                    onChanged: (value) {
                      setState(() {
                        aceita = value!;
                      });
                    },
                  ),
                  const Text('Aceito os termos / receber e-mail'),
                ],
              ),

              const SizedBox(height: 15),

              // Botão
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    textoFinal = 'Resultado: ${controller.text}';
                    controller.clear(); // 🔥 evita duplicidade no teste
                  });
                },
                child: const Text('Cadastrar'),
              ),

              const SizedBox(height: 15),

              // Resultado final
              Text(textoFinal),
            ],
          ),
        ),
      ),
    );
  }
}