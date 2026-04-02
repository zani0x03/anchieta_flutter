import 'package:flutter/material.dart';

void main(){
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
  @override
  Widget build(BuildContext context){
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
final TextEditingController _controller = TextEditingController();
String _nomeProduto ="";
double _sliderValue = 10.0;
String? _selectedRadio = "";
String _dropdownValue = "Norte";
bool _isChecked = false;
String _conjuntoDados = "";
String _textoValidacao = "";
  
@override
Widget build(BuildContext context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text("Preencha com o nome do produto: "),
              TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Produto',
                border: OutlineInputBorder(),
              ),
              onChanged: (valor){
                setState((){
                  _nomeProduto = valor;
                });
              }
              ),
              
              Text("Defina a quantidade: "),
              Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              divisions: 100,
              label: _sliderValue.round().toString(),
              onChanged: (double val) =>setState(() =>
                  _sliderValue = val)
                ),
              
              Text("Escolha o tipo de entrega: "),
              Radio<String>(
              value: 'Carreto',
                groupValue: _selectedRadio,
                onChanged:  (val) => setState(() => _selectedRadio = val),
                ),
              const Text("Carreto"), 
              Radio<String>(
              value: 'Retirada',
                groupValue: _selectedRadio,
                onChanged:  (val) => setState(() => _selectedRadio = val),
                ),
              const Text("Retirada"),       
              Radio<String>(
              value: 'Correio',
                groupValue: _selectedRadio,
                onChanged: (val) => setState(() => _selectedRadio = val),
                ),
              const Text("Correio"),
              
              Text("Escolha a região: "),
              DropdownButton<String>(
              value: _dropdownValue,
                onChanged: (String? newValue) { setState(() => _dropdownValue = newValue!);
                },
                items: <String>['Norte', 'Sul', 'Centro-Oeste', 'Nordeste','Sudeste']
                .map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                  );
                })
                .toList(),
                ),
              
              const Text("Deseja receber promoções via e-mail?"),
              Checkbox(
              value: _isChecked,
              onChanged: (bool? val) {setState(() =>
                  _isChecked = val!);
               },
              ),
              const Text("Sim, eu desejo receber promoções via e-mail."),
              
              ElevatedButton(
              onPressed: ()
                {setState(() =>
                  _conjuntoDados = "O produto selecionado foi: $_nomeProduto, mas a quantidade escolhida de produtos foi $_sliderValue. O pedido será entregue via $_selectedRadio. Já a região de entrega será $_dropdownValue. O cliente aceita o envio de promoções? ${_isChecked ? "Aceita" : "Não aceita"} ");
              },
                child: const Text('Cadastrar'),
              ),
              
              Text(_conjuntoDados),
            ]
          ),
        ),
      );
  }
}