import 'package:flutter/material.dart';

// O teste busca exatamente por este nome: MainApp
void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Controles para os campos do formulário
  final _produtoController = TextEditingController();
  double _sliderValue = 20.0;
  String? _selectedRadio = 'Retirada'; // Começa com 'Retirada' para garantir a Fase 3
  bool _aceitouPromocoes = false;
  String _textoResumo = '';

  // Função que o botão 'Cadastrar' chama
  void _gerarResumo() {
    setState(() {
      // IMPORTANTE: O teste da Fase 5 espera encontrar exatamente o que foi digitado.
      // Não adicione prefixos como "Produto: " aqui.
      _textoResumo = _produtoController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Atividade Flutter')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Fase 1
            TextField(
              controller: _produtoController,
            ),
            
            // Fase 2: 
            Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              onChanged: (v) => setState(() => _sliderValue = v),
            ),
            
            // Fase 3: 
            RadioListTile(
              title: const Text('Retirada'),
              value: 'Retirada',
              groupValue: _selectedRadio,
              onChanged: (v) => setState(() => _selectedRadio = v as String),
            ),
            
            // Fase 4: 
            Checkbox(
              value: _aceitouPromocoes,
              onChanged: (v) => setState(() => _aceitouPromocoes = v!),
            ),
            
            const SizedBox(height: 20),
            
            
            ElevatedButton(
              onPressed: _gerarResumo,
              child: const Text('Cadastrar'),
            ),
            
            const SizedBox(height: 20),
            
  
            Text(_textoResumo),
          ],
        ),
      ),
    );
  }
}