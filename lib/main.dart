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

class Category extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry margin;

  const Category({
    super.key,
    required this.child,
    this.margin = const EdgeInsets.only(top: 8),
  });

  @override
  Widget build(BuildContext context) {
    return Container(margin: margin, alignment: Alignment.center, child: child);
  }
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  String _product = "";
  String _deliveryType = "Regular";
  bool _acceptEmail = false;
  double _quantity = 0;
  String? _selectedRegion;

  String? _resultProduct;
  double? _resultQuantity;
  String? _resultDeliveryType;
  String? _resultRegion;
  bool? _resultAcceptEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Olá Flutter')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Preenche com o nome do produto:',
                style: TextStyle(color: Colors.black87),
              ),
              const SizedBox(height: 5),

              TextField(
                controller: _controller,
                onChanged: (value) {
                  setState(() {
                    _product = value;
                  });
                },
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.account_box_outlined),
                ),
              ),

              const SizedBox(height: 5),

              const Category(
                child: Text(
                  'Defina a quantidade:',
                  style: TextStyle(color: Colors.black87),
                ),
              ),

              Slider(
                value: _quantity,
                max: 100,
                min: 0,
                onChanged: (double value) {
                  setState(() {
                    _quantity = value;
                  });
                },
              ),

              const SizedBox(height: 5),

              const Category(
                child: Text(
                  'Escolha o tipo de entrega:',
                  style: TextStyle(color: Colors.black87),
                ),
              ),

              Column(
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Carreto',
                        groupValue: _deliveryType,
                        onChanged: (v) => setState(() => _deliveryType = v!),
                      ),

                      const Text("Carreto"),
                    ],
                  ),

                  Row(
                    children: [
                      Radio<String>(
                        value: 'Retirada',
                        groupValue: _deliveryType,
                        onChanged: (v) => setState(() => _deliveryType = v!),
                      ),

                      const Text("Retirada"),
                    ],
                  ),

                  Row(
                    children: [
                      Radio<String>(
                        value: 'Correio',
                        groupValue: _deliveryType,
                        onChanged: (v) => setState(() => _deliveryType = v!),
                      ),

                      const Text("Correio"),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 5),

              const Category(
                child: Text(
                  'Escolha a região:',
                  style: TextStyle(color: Colors.black87),
                ),
              ),

              Center(
                child: SizedBox(
                  width: 200,
                  child: DropdownButtonFormField<String>(
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    hint: const Text("Selecione"),
                    isExpanded: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                    ),

                    items: ['Norte', 'Sul', 'Leste', 'Oeste', 'Centro']
                        .map(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedRegion = newValue;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 5),

              const Category(
                child: Text(
                  'Deseja receber promoções via e-mail?',
                  style: TextStyle(color: Colors.black87),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _acceptEmail,
                    onChanged: (bool? value) {
                      setState(() {
                        _acceptEmail = value ?? false;
                      });
                    },
                  ),

                  const Flexible(
                    child: Text("Sim, eu desejo receber promoções via e-mail."),
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
                        _resultProduct = _product;
                        _resultQuantity = _quantity;
                        _resultDeliveryType = _deliveryType;
                        _resultRegion = _selectedRegion;
                        _resultAcceptEmail = _acceptEmail;
                        _controller.clear();
                      });
                    },
                    child: const Text('Cadastrar'),
                  ),
                ),
              ),

              const SizedBox(height: 5),

              if (_resultProduct != null)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'O produto selecionado foi: $_resultProduct, '
                    'mas a quantidade de produtos escolhida foi ${_resultQuantity!.toInt()}. '
                    'O pedido será entregue via $_resultDeliveryType. '
                    'Já a região de entrega será ${_resultRegion ?? "Não informada"}. '
                    'O cliente aceita envio de promoções ${_resultAcceptEmail! ? "Aceito" : "Não aceito"}.',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}