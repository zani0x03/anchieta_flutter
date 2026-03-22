import 'package:flutter/material.dart';
void main() {
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nomeController = TextEditingController();
  double _quantidade = 0;
  String? _tipoEntrega = 'Carreto';
  String _regiaoSelecionada = 'Sudeste';
  bool _aceitouTermos = false;
  String _resumo = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulário de Cadastro')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome do Produto'),
            ),
            const SizedBox(height: 20),
            Text('Quantidade: ${_quantidade.toInt()}'),
            Slider(
              value: _quantidade,
              min: 0,
              max: 100,
              divisions: 100,
              label: _quantidade.round().toString(),
              onChanged: (val) => setState(() => _quantidade = val),
            ),
            const SizedBox(height: 20),
            const Text("Tipo de entrega:"),
            Row(
              children: [
                Radio<String>(
                  value: 'Carreto',
                  groupValue: _tipoEntrega,
                  onChanged: (val) => setState(() => _tipoEntrega = val),
                ),
                const Text("Carreto"),
                Radio<String>(
                  value: 'Retirada',
                  groupValue: _tipoEntrega,
                  onChanged: (val) => setState(() => _tipoEntrega = val),
                ),
                const Text("Retirada"),
                Radio<String>(
                  value: 'Correio',
                  groupValue: _tipoEntrega,
                  onChanged: (val) => setState(() => _tipoEntrega = val),
                ),
                const Text("Correio"),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Região:"),
            DropdownButton<String>(
              value: _regiaoSelecionada,
              isExpanded: true,
              items: <String>['Norte', 'Nordeste', 'Centro-Oeste', 'Sudeste', 'Sul']
                  .map((String valor) {
                return DropdownMenuItem<String>(
                  value: valor,
                  child: Text(valor),
                );
              }).toList(),
              onChanged: (val) => setState(() => _regiaoSelecionada = val!),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _aceitouTermos,
                  onChanged: (val) => setState(() => _aceitouTermos = val!),
                ),
                const Text("Aceito os termos e receber e-mails"),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _resumo = "Produto: ${_nomeController.text}\n"
                        "Qtd: ${_quantidade.toInt()}\n"
                        "Entrega: $_tipoEntrega\n"
                        "Região: $_regiaoSelecionada\n"
                        "Termos: ${_aceitouTermos ? 'Sim' : 'Não'}";
                                        _nomeController.clear(); 
                  });
                },
                child: const Text('Cadastrar'),
              ),
            ),
            const SizedBox(height: 30),
            if (_resumo.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.grey[200],
                width: double.infinity,
                child: Text(
                  _resumo,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}