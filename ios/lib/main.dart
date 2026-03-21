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
  final TextEditingController _controller = TextEditingController();
  String _nomeProduto = "";
  double _sliderValue = 0.0;
  String? _selectedRadio = '';
  String _dropdownValue = 'Norte';
  bool _isCheckboxChecked = false;
  String _resumo = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Olá Flutter'), centerTitle: true),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Preencha com o nome do produto:'),

                const SizedBox(height: 20),

                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Digite o nome do produto',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (valor) {
                    setState(() {
                      _nomeProduto = valor;
                    });
                  },
                ),

                const SizedBox(height: 30),

                Text("Defina a Quantidade: ${_sliderValue.round()}"),

                Slider(
                  value: _sliderValue,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: _sliderValue.round().toString(),
                  onChanged: (double val) {
                    setState(() {
                      _sliderValue = val;
                    });
                  },
                ),

                const Text("Escolha o tipo de entrega:"),
                Row(
                  children: [
                    Radio<String>(
                      value: 'A',
                      groupValue: _selectedRadio,
                      onChanged: (val) => setState(() => _selectedRadio = val),
                    ),
                    const Text("Carreto"),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: 'B',
                      groupValue: _selectedRadio,
                      onChanged: (val) => setState(() => _selectedRadio = val),
                    ),
                    const Text("Retirada"),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: 'C',
                      groupValue: _selectedRadio,
                      onChanged: (val) => setState(() => _selectedRadio = val),
                    ),
                    const Text("Correio"),
                  ],
                ),
                const Text("DropdownButton:"),
                DropdownButton<String>(
                  value: _dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() => _dropdownValue = newValue!);
                  },
                  items: <String>['Norte', 'Sul', 'Leste', 'Oeste']
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                      .toList(),
                ),

                const Text("Deseja receber promoções via e-mail?"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _isCheckboxChecked,
                      onChanged: (bool? value) {
                        setState(() => _isCheckboxChecked = value!);
                      },
                    ),
                    const Text("Sim, desejo receber promoções via e-mail."),
                  ],
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      String tipoEntregaTexto = "";

                      if (_selectedRadio == 'A') tipoEntregaTexto = "Carreto";
                      if (_selectedRadio == 'B') tipoEntregaTexto = "Retirada";
                      if (_selectedRadio == 'C') tipoEntregaTexto = "Correio";

                      _resumo =
                          "O produto selecionado foi: $_nomeProduto, "
                          "mas a quantidade de produtos escolhida foi ${_sliderValue.round()}. "
                          "O pedido será entregue via $tipoEntregaTexto. "
                          "A região de entrega será $_dropdownValue. "
                          "O cliente aceita o envio de promoções: "
                          "${_isCheckboxChecked ? "Aceito" : "Não aceita"}";
                    });
                  },
                  child: const Text('Cadastrar'),
                ),

                const SizedBox(height: 20),

                Text(_resumo, textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
