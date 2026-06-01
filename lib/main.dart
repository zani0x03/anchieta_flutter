import 'package:flutter/material.dart';

double _currentSliderValue = 20;
bool _isCheckboxChecked = false;
String? _selectedRadio = 'Nenhum';
final TextEditingController _textController = TextEditingController();
String _textFieldValue = "";
String _dropdownValue = "Centro";
String _resultado = "";

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

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Olá Flutter')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Preenche com o nome do produto: ",
                textAlign: TextAlign.center,
              ),

              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Produto',
                  
                ),
                onChanged: (valor) {
                  setState(() {
                    _textFieldValue = valor;
                  });
                },
              ),

              Text(
                "Defina a quantidade: ",
                textAlign: TextAlign.center,
                
              ),


              Slider(
              
              value: _currentSliderValue,
              min: 0,
              max: 100,
              divisions: 50,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
                }),

                Text(
                "Escolha o tipo de entrega: ",
                textAlign: TextAlign.center,
                
              ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Radio<String>(
                      value: 'Carreto',
                      groupValue: _selectedRadio,
                      onChanged: (val) => setState(() => _selectedRadio = val),
                      ),
                      const Text("Carreto"),
                      ],
                    ),

                    Row(
                      children: [
                        Radio<String>(
                      value: 'Retirada',
                      groupValue: _selectedRadio,
                      onChanged: (val) => setState(() => _selectedRadio = val),
                      ),
                      const Text("Retirada"),
                      ],
                    ),
                    
                    Row(
                      children: [
                      Radio<String>(
                      value: 'Correio',
                      groupValue: _selectedRadio,
                      onChanged: (val) => setState(() => _selectedRadio = val),
                      ),
                      const Text("Correio")],
                    ),

                    
                  ]
                ),

              Text("Escolha a região"),
              DropdownButton<String>(
                value: _dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    _dropdownValue = newValue!;
                  });
                },
                items: <String>["Centro", "Jundiaí", "Varzea pt", "Campo limpo"]
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                })
                .toList()
              ),

              Text(
                "Deseja receber promoções via e-mail? ",
                textAlign: TextAlign.center,
                
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                value: _isCheckboxChecked, onChanged: (bool? value){
                setState(() => _isCheckboxChecked = value!);
                
              }),

              Text(
                "Sim, eu desejo receber promoções via e-mail. ",
              ),
                ],
              ),

              

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                  // textStyle: TextStyle(color: Colors.white), 
                ),
                onPressed: () => setState(() {
                _resultado = 
                'O Produto Selecionado foi: ${_textFieldValue.isEmpty ? "Nenhum" : _textFieldValue},\n'
                'mas a quantidade de produtos escolhida foi $_currentSliderValue\n'
                'O pedido será entregue via $_selectedRadio\n'
                'Já a região de entrega será $_dropdownValue.\n'
                'O Cliente aceita o envio de promoções ${_isCheckboxChecked ? "Aceito" : "Recusado"}';

                _textController.clear();
                }),
                child: Text("Cadastrar"),
                
              ),

              Text(
                _resultado,
                textAlign: TextAlign.center,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
