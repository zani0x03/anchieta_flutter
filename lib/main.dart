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
  String _valorProduto = '';
  double _valorSlide = 20.0;
  String? _valorRadio = 'A';
  String _valorDropdown = 'Norte';
  bool _valorCheck = false;
  String _cadastro = '';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Olá Flutter')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Nome do Produto'),
                onChanged: (value) {
                   setState(() {
                    _valorProduto = value;
                    
                  });
                },
                ),
              Slider(
                value: _valorSlide,
                min: 0,
                max: 100,
                divisions: 100,
                label: _valorSlide.round().toString(),
                onChanged: (double val) => setState(() => _valorSlide = val),
              ),
              Row(
                children: [
                  Radio<String>(
                    value: 'Carreto',
                    groupValue: _valorRadio,
                    onChanged: (val) => setState(() => _valorRadio = val),
                  ),
                  const Text("Carreto"),
                  Radio<String>(
                    value: 'Correio',
                    groupValue: _valorRadio,
                    onChanged: (val) => setState(() => _valorRadio = val),
                  ),
                  const Text("Correio"),
                  Radio<String>(
                    value: 'Retirada',
                    groupValue: _valorRadio,
                    onChanged: (val) => setState(() => _valorRadio = val),
                  ),
                  const Text("Retirada"),
                ],
              ),
              DropdownButton<String>(
                value: _valorDropdown,
                onChanged: (String? novoValor) {
                  setState(() => _valorDropdown = novoValor!);
                },
                items: <String>['Norte', 'Sul', 'Oeste', 'Sudeste', 'Nordeste']
                    .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    })
                    .toList(),
              ),
              Row(
                children: [
                Checkbox(
                    value: _valorCheck,
                    onChanged: (bool? value) {
                      setState(() => _valorCheck = value!);
                    },
                  ),
                  Text('aceite de termos/e-mail.')
                ],
              ),
              ElevatedButton(
                child: Text("Cadastrar"),
                onPressed: () {
                  setState(() {
                    _cadastro = "Nome: ${_valorProduto}\nQuantia: ${_valorSlide}\nEntrega: ${_valorRadio}\nRegião: ${_valorDropdown}\nTermos e Email: ${_valorCheck}";
                    _controller.clear();
                  });
                },
              ),
              Text(_cadastro)
            ],
          ),
        ),
      ),
    );
  }
}
