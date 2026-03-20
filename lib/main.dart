import 'package:flutter/foundation.dart';
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
  String _Jorge = "";
  bool _isJorge = false;
  String _dropJorge = 'Leste';
  String? _RadioJorge = 'Carreto';
  double _sliderJorge = 20.0;
  var resultado = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Desafio Marcos')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Digite o nome',
                  border: OutlineInputBorder(),
                ),
                  onChanged: (valor) {
                    setState((){
                      _Jorge = valor;
                    });
                  },
              ),
              const Text("Deseja rececber promocoes via e-mail?"),
              Checkbox(value: _isJorge,
              onChanged: (bool? value) {
                setState(() => _isJorge = value!);
              },
            ),
            const Text("Escolha a região"),
            DropdownButton<String>(
              value: _dropJorge,
              onChanged: (String? newValue) {
                setState(() => _dropJorge = newValue!);
                },
                items: <String>['Leste', 'Oeste', 'Nordeste']
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                })
                .toList(),
              ),
              const Text ("Escolha o tipo de entrega"),
              Row(
                children: [
                  Radio<String>(
                    value: 'Carreto',
                    groupValue: _RadioJorge,
                    onChanged: (val) =>(() => _RadioJorge =val),
                    ),
                    const Text("Carreto"),
                    Radio<String>(
                      value: "Retirada",
                      groupValue: _RadioJorge,
                      onChanged: (val) => (() => _RadioJorge = val,),
                    ),
                    const Text("Retirada"),
                    Radio<String>(
                    value: 'Correio',
                    groupValue: _RadioJorge,
                    onChanged: (val) => setState(() => _RadioJorge = val),
                    ),
                    const Text("Correio"),
                ],
              ),
              Text("Slider (Valor: ${_sliderJorge.round()})"),
              Slider(
                value: _sliderJorge,
                min: 0,
                max: 100,
                divisions: 100,
                label: _sliderJorge.round().toString(),
                onChanged: (double val) => setState(() => _sliderJorge = val),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    resultado = "A quantidade é $_sliderJorge, $_Jorge, $_RadioJorge, $_dropJorge, _$_isJorge";
                  });
                },
                child: Text("Cadastrar"),
              ),
              Text(resultado)
                
            ],
          ),
        ),
      ),
    );
  }
}
