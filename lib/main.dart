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
  String? _nomeProduto;
  String? _nomeProdutoFinal;
  double _quantidade = 0.0;
  int? _quantidadeFinal;
  String? _entrega;
  String? _entregaFinal;
  String? _regiao;
  String? _regiaoFinal;
  bool _promocao = false;
  String? _promocaoFinal;
  bool _result = false;
  bool get _formularioValido => 
    _result &&
    _nomeProdutoFinal != null &&
    _quantidade > 0 &&
    _entrega != null &&
    _regiao != null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Olá Flutter')),
        body: Center(
          child: SingleChildScrollView( // tava crashando sem isso, não vou colocar horizontal, preguiça
            padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Preenche com o nome do Produto:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
              ),
              Padding(
                padding: EdgeInsets.all(20), 
                child: 
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _nomeProduto = value;
                    });
                  },
                  autocorrect: true, 
                  decoration: 
                  InputDecoration(
                    hintText: "Nome do produto",
                    labelText: "Produto", 
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.person)
                  )
                )
              ),
              Text(
                "Defina a quantidade: ${_quantidade.round()}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Slider(
                  value: _quantidade, 
                  min: 0.0,
                  max: 8001.0,
                  onChanged: (value) {
                    setState(() {
                      _quantidade = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child:
                Text(
                  "Escolha o tipo de entrega:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                ),
              ),
/*era pra fazer radio aqui :skull:               DropdownButton(
                items: ["Carreto", "Retirada", "Correio"].map((String entrega){ 
                  return DropdownMenuItem (
                    value: entrega,
                    child: Text(entrega),
                  );
                }).toList(), // cacete que syntax chata
                onChanged: (String? novo) {
                  setState(() {
                    //
                  });
                }
              ) */
              RadioGroup(
                groupValue: _entrega,
                onChanged: (String? novo){
                  setState(() {
                    _entrega = novo!;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio(
                          value: "Carreto"
                          ),
                          Text("Carreto", style: TextStyle(fontSize: 14))
                        ],
                      ),

                      SizedBox(height: 10),

                      Row(
                        children: [
                          Radio(
                          value: "Retirada"
                          ),
                          Text("Retirada", style: TextStyle(fontSize: 14))
                        ],
                      ),

                      SizedBox(height: 10),

                      Row(
                        children: [
                          Radio(
                          value: "Correio"
                          ),
                          Text("Correio", style: TextStyle(fontSize: 14))
                        ],
                      ),
                    ],
                  ),
                )
              ),
              SizedBox(height: 10),
/*               Column(
                children: [
                  Radio(
                    value: "Carreto",
                    groupValue: _radio,
                  ),
                  Radio(
                    value: "Retirada",
                    groupValue: _radio
                  ),
                  RadioGroup(
                    value: "Correio",
                    groupValue: _radio
                  )
                ],
              ) */
              Text(
                "Escolha a região:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
              ),

              SizedBox(height: 30),
            //agora sim é o dropdown :D
              DropdownButton(
                value: _regiao,
                items: ["Norte", "Leste", "Sul", "Oeste"].map((String regiaoMap){ 
                  return DropdownMenuItem (
                    value: regiaoMap,
                    child: Text(regiaoMap),
                  );
                }).toList(), // cacete que syntax chata
                onChanged: (String? novo) {
                  setState(() {
                    _regiao = novo;
                  });
                }
              ),

              SizedBox(height: 30),

              Text(
                "Deseja receber promoções via e-mail?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _promocao, 
                    onChanged: (bool? novo) {
                      setState(() {
                        _promocao = novo!;
                      });
                    }
                  ),
                  Text(
                    "Sim, eu desejo receber promoções via e-mail",
                    style: TextStyle(fontSize: 16)
                  ),
                ],
              ),
              SizedBox(height: 30),

              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _result = true;
                    _nomeProdutoFinal = _nomeProduto;
                    _quantidadeFinal = _quantidade.round();
                    _entregaFinal = _entrega;
                    _regiaoFinal = _regiao;
                    _promocaoFinal = _promocao
                      ? "O cliente aceita o envio de promoções"
                      : "O cliente não aceita o envio de promoções";
                  });
                }, 
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Color(0xff607d8b))
                ),
                child: Text(
                  "Cadastrar",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
              SizedBox(height: 30),

              _formularioValido
                ? Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "O produto selecionado foi: $_nomeProdutoFinal, e a quantidade de produtos escolhida foi ${_quantidadeFinal?.toInt()}. O pedido será entregue via $_entregaFinal. Já a região de entrega será $_regiaoFinal. $_promocaoFinal",
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )
                : _result
                  ? Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Por favor, preencha todos os campos antes de cadastrar!",
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
                    ),
                  )
                  : SizedBox.shrink()
            ],
          ),
        )),
      ),
    );
  }
}
