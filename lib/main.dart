import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  String _nomeInput = ""; 
  String _resultado = ""; 
  String _tipoEntrega = 'Regular';
  bool _aceitaPromocoes = false;
  double _currentSliderValue = 0;
  String? _regiaoSelecionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Olá Flutter')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Preencha com o nome do Produto:',
              style: TextStyle(color: Colors.black87),
            ),
            const SizedBox(height: 5),

            TextField(
              controller: _controller,
              onChanged: (valor) {
                setState(() {
                  _nomeInput = valor;
                });
              },
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.account_box_outlined),
                prefixText: "Produto ",
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Defina Quantidade:',
              style: TextStyle(color: Colors.black87),
            ),

            Slider(
              value: _currentSliderValue,
              max: 100,
              min: 0,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),

            const SizedBox(height: 5),

            const Text(
              'Escolha o tipo de Entrega:',
              style: TextStyle(color: Colors.black87),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'Carreto',
                  groupValue: _tipoEntrega,
                  onChanged: (v) => setState(() => _tipoEntrega = v!),
                ),
                const Text("Carreto"),
                Radio<String>(
                  value: 'Retirada',
                  groupValue: _tipoEntrega,
                  onChanged: (v) => setState(() => _tipoEntrega = v!),
                ),
                const Text("Retirada"),
                Radio<String>(
                  value: 'Correio',
                  groupValue: _tipoEntrega,
                  onChanged: (v) => setState(() => _tipoEntrega = v!),
                ),
                const Text("Correio"),
              ],
            ),

            const SizedBox(height: 5),

            const Text(
              'Escolha a Região:',
              style: TextStyle(color: Colors.black87),
            ),
              Center(
              child: SizedBox(
                width: 200,
                child: DropdownButtonFormField<String>(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  iconSize: 24,
                  hint: const Text("Selecione"),
                  isExpanded: true,
                  decoration:
                    const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    ),
                  items: ['Norte', 'Sul', 'Leste', 'Oeste', 'Centro']
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  onChanged: (novoValor) {
                    setState(() {
                      _regiaoSelecionada = novoValor;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 5),

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
                const Flexible(
                  child: Text("Sim, eu aceito receber promoções via e-mail."),
                ),
              ],
            ),

            const SizedBox(height: 5),

            Center(
              child: SizedBox(
                width: 150, 
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 90, 93, 95),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _resultado = _nomeInput;

                      _controller.clear();
                    });
                  },
                  child: const Text('Cadastrar'),
                ),
              ),
            ),

            const SizedBox(height: 5),
            
            if (_resultado.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'O produto selecionado foi: $_resultado, mas a quantidade escolhida foi ${_currentSliderValue.toInt()}. '
                  'O pedido será entregue via $_tipoEntrega. Já a região será ${_regiaoSelecionada ?? "não informada"}. '
                  'O cliente aceita envio de promoções? ${_aceitaPromocoes ? "Sim" : "Não"}.',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                
                ),
              ),
          ],
        ),
      ),
    );
  }
}