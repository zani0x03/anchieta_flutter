import 'package:flutter/material.dart';
import 'package:anchieta_flutter/entrada/widgets.dart';


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
  String _nomeProduto = '';
  String _resultado = '';
  double _sliderValue = 20.0;
  String? _selectedRadio = 'A';
  bool _isCheckboxChecked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold
      (
        appBar: AppBar(title: Text('Desenvolvimento mobile')),
        body: Center(
          child: Column(
            children: [
              InputProduto(
                controller: _controller,
                onChanged: (valor) {
                  setState(() {
                    _nomeProduto = valor;
                 });
               },
              ),

              Text("Preço: ${_sliderValue.round()}"),

              BarradePreco(
                valor: _sliderValue,
                onChanged: (double val) {
                setState(() {
                  _sliderValue = val;
                });
                },
              ),

              const Text("Tipo de entrega:"),

              TipoEntregaRadio(
                valorSelecionado: _selectedRadio,
                onChanged: (String? val) {
                  setState(() {
                  _selectedRadio = val;
                  });
                },
               ),

              Text("Selecionado: ${_selectedRadio ?? 'Nenhum'}"),

              const Text("Você confirma essas informações?:"),

              Checkbox(
                value: _isCheckboxChecked,
                onChanged: (bool? value) {
                  setState(() => _isCheckboxChecked = value!);
                },
              ),

              if (_resultado.isNotEmpty)
                Text(_resultado),

              BotaoCadastrar(
                onPressed: () {
                  setState(() {
                    _resultado = "Produto: $_nomeProduto";
                    _controller.clear();
                  });
                },  
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
