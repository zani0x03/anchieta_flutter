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
  double sliderValue = 0;
  String? entrega = "Carreto";
  bool cbTermos = false;
  TextEditingController retorno = TextEditingController();
  String? produto = "";
    
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Olá Flutter')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: retorno, decoration: InputDecoration(border:OutlineInputBorder(), labelText: "Teste")),
              Slider(value: sliderValue, max: 100, onChanged: (double value){setState(() {
                sliderValue = value;
                });
              },
              ),
              Column(children: [
                RadioListTile<String>(
                  title:Text("Carreto"),
                  value:"Carreto",
                  groupValue:entrega,
                  onChanged: (value){
                    setState(() {
                      entrega = value;
                    });
                  },),
                  RadioListTile<String>(
                  title:Text("Retirada"),
                  value:"Retirada",
                  groupValue:entrega,
                  onChanged: (value){
                    setState(() {
                      entrega = value;
                    });
                  },),
                  RadioListTile<String>(
                  title:Text("Correio"),
                  value:"Correio",
                  groupValue:entrega,
                  onChanged: (value){
                    setState(() {
                      entrega = value;
                    });
                  },)
              ],),
              Row(
                children: [
                  Checkbox(
                    value: cbTermos,
                    onChanged: (value) {
                      setState(() {
                        cbTermos = value!;
                      });
                    },
                  ),
                  Text("Aceito os termos e receber novidades no email"),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  produto = retorno.text;
                  print(produto);
                },
                child: Text("Cadastrar"),
              )
            ]
          ),
        ),
      ),
    );
  }
}
