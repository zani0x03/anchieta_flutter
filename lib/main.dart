import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nome = "";
  String _avaliacao = 'Regular';
  bool _aceitaPromocoes = false;
  double _currentSliderValue = 0;

  //SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Olá Flutter')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:
        ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Preencha com o nome do Produto:',
              style: const TextStyle(fontSize: 32, color: Colors.black87),
            ),
            const SizedBox(height: 20),

            TextField(
              onChanged: (valor) {
                setState(() {
                  nome = valor;
                });
              },
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
              suffixIcon: Icon(Icons.account_box_outlined), 
                prefixText: "Produto",
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'Defina Quantidade:',
              style: const TextStyle(fontSize: 32, color: Colors.black87),
            ),

            const SizedBox(height: 20),

            Slider(
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
              value: _currentSliderValue,
              max: 100,
              min: 0,
            ),

            const SizedBox(height: 20),

            Text(
              'Escolha o tipo de Entrega:',
              style: const TextStyle(fontSize: 32, color: Colors.black87),
            ),

            const SizedBox(height: 20),
            
              RadioListTile<String>(
                title: const Text("Carreto"),
                value: 'Carreto',
                groupValue: _avaliacao,
                onChanged: (String? value) {
                  setState(() => _avaliacao = value!);
                },
              ),

              RadioListTile<String>(
                title: const Text("Retirada"),
                value: 'Retirada',
                groupValue: _avaliacao,
                onChanged: (String? value) {
                  setState(() => _avaliacao = value!);
                },
              ),

              RadioListTile<String>(
                title: const Text("Correio"),
                value: 'Correio',
                groupValue: _avaliacao,
                onChanged: (String? value) {
                  setState(() => _avaliacao = value!);
                },
              ),

            const SizedBox(height: 20),
            
            Text(
              'Escolha a Região:',
              style: const TextStyle(fontSize: 32, color: Colors.black87),
            ),

            // aula06 falta 
            const SizedBox(height: 20),


              RadioListTile<String>(
                title: const Text("Norte"),
                secondary: const Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.red,
                ),
                value: 'Ruim',
                groupValue: _avaliacao,
                onChanged: (String? value) {
                  setState(() => _avaliacao = value!);
                },
              ),

              RadioListTile<String>(
                title: const Text("Sul"),
                secondary: const Icon(
                  Icons.sentiment_neutral,
                  color: Colors.orange,
                ),
                value: 'Regular',
                groupValue: _avaliacao,
                onChanged: (String? value) {
                  setState(() => _avaliacao = value!);
                },
              ),

              RadioListTile<String>(
                title: const Text("Leste"),
                secondary: const Icon(
                  Icons.sentiment_satisfied,
                  color: Colors.green,
                ),
                value: 'Ótimo',
                groupValue: _avaliacao,
                onChanged: (String? value) {
                  setState(() => _avaliacao = value!);
                },
              ),

              RadioListTile<String>(
                title: const Text("Oeste"),
                secondary: const Icon(
                  Icons.sentiment_satisfied,
                  color: Colors.green,
                ),
                value: 'Ótimo',
                groupValue: _avaliacao,
                onChanged: (String? value) {
                  setState(() => _avaliacao = value!);
                },
              ),

              RadioListTile<String>(
                title: const Text("Centro"),
                secondary: const Icon(
                  Icons.sentiment_satisfied,
                  color: Colors.green,
                ),
                value: 'Ótimo',
                groupValue: _avaliacao,
                onChanged: (String? value) {
                  setState(() => _avaliacao = value!);
                },
              ),

            const SizedBox(height: 20),

            Text(
              'Deseja receber promoções via e-mail?:',
              style: const TextStyle(fontSize: 32, color: Colors.black87),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _aceitaPromocoes,
                  onChanged: (bool? valor) {
                    setState(() {
                      _aceitaPromocoes = valor ?? false;
                    });
                  },
                ),
                Text(
                  "Sim, eu aceito receber promoções via e-mail.",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            
            SizedBox(height: 20),

            OverflowBar(
              spacing: 12,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 115, 116, 117),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  onPressed: () {},
                  child: Text('Cadastrar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
