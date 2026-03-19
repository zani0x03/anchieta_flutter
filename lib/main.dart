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
  final TextEditingController _productNameController = TextEditingController();

  String _productName = '';
  double _quantity = 0;
  String _deliveryType = 'Correio';
  String _region = 'Norte';
  bool _email = false;
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Olá Flutter')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Preenche com o nome do Produto:'),
            TextField(
              controller: _productNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Produto',
              ),
              onChanged: (value) {
                setState(() {
                  _productName = value;
                });
              },
            ),
            const SizedBox(height: 15),
            const Text('Defina a quantidade:'),
            Slider(
              value: _quantity,
              min: 0,
              max: 100,
              divisions: 100,
              label: _quantity.round().toString(),
              onChanged: (double val) => setState(() => _quantity = val),
            ),
            const SizedBox(height: 15),
            const Text('Escolha o tipo de entrega:'),
            Column(
              children: [
                ListTile(
                  title: const Text('Carreto'),
                  leading: Radio<String>(
                    value: 'Carreto',
                    groupValue: _deliveryType,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() => _deliveryType = newValue);
                      }
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Retirada'),
                  leading: Radio<String>(
                    value: 'Retirada',
                    groupValue: _deliveryType,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() => _deliveryType = newValue);
                      }
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Correio'),
                  leading: Radio<String>(
                    value: 'Correio',
                    groupValue: _deliveryType,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() => _deliveryType = newValue);
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text('Escolha a região:'),
            DropdownButton<String>(
              value: _region,
              onChanged: (String? newValue) {
                setState(() => _region = newValue!);
              },
              items: <String>['Centro', 'Norte', 'Sul', 'Sudeste', 'Nordeste']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  })
                  .toList(),
            ),
            const SizedBox(height: 15),
            const Text('Deseja receber promoções via e-mail?'),
            Checkbox(
              value: _email,
              onChanged: (value) {
                setState(() => _email = value!);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _result =
                      'O produto selecionado foi: $_productName, mas a quantidade de produtos escolhida foi ${_quantity.toInt()}. '
                      'O pedido será entregue via $_deliveryType. '
                      'Já a região de entrega será $_region. '
                      'O cliente aceita o envio de promoções: ${_email ? 'Aceito' : 'Não aceito'}';
                });
              },
              child: const Text('Cadastrar'),
            ),
            const SizedBox(height: 10),
            Text(_result),
          ],
        ),
      ),
    );
  }
}
