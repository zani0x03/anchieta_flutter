import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Formulario(),
      ),
    );
  }
}

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final nomeController = TextEditingController();
  double valorSlider = 1.0;
  String tipoEntrega = 'Carreto';
  String regiaoSelecionada = 'Sudeste';
  bool aceitou = false;
  String resultado = '';

  void finalizar() {
    setState(() {
      resultado = nomeController.text;
      nomeController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: nomeController,
            decoration: const InputDecoration(labelText: 'Nome do produto'),
          ),
          Slider(
            value: valorSlider,
            min: 1.0,
            max: 100.0,
            onChanged: (novoValor) {
              setState(() {
                valorSlider = novoValor;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Carreto'),
            value: 'Carreto',
            groupValue: tipoEntrega,
            onChanged: (valor) {
              setState(() {
                tipoEntrega = valor!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Retirada'),
            value: 'Retirada',
            groupValue: tipoEntrega,
            onChanged: (valor) {
              setState(() {
                tipoEntrega = valor!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Correio'),
            value: 'Correio',
            groupValue: tipoEntrega,
            onChanged: (valor) {
              setState(() {
                tipoEntrega = valor!;
              });
            },
          ),
          DropdownButton<String>(
            value: regiaoSelecionada,
            items: <String>['Norte', 'Nordeste', 'Sudeste', 'Sul', 'Centro-Oeste']
                .map((String valor) {
              return DropdownMenuItem<String>(
                value: valor,
                child: Text(valor),
              );
            }).toList(),
            onChanged: (novo) {
              setState(() {
                regiaoSelecionada = novo!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Aceito os termos'),
            value: aceitou,
            onChanged: (valor) {
              setState(() {
                aceitou = valor!;
              });
            },
          ),
          ElevatedButton(
            onPressed: finalizar,
            child: const Text('Cadastrar'),
          ),
          const SizedBox(height: 20),
          Text(resultado),
        ],
      ),
    );
  }
}