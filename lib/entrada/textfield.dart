import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}


class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final TextEditingController _dateController = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  final String _nomeUsuario = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Olá Flutter'),
        ),
        body: Center(
          child: Column(
            children: [
              // TextField(),
              // TextField(
              //   // 3. Vincule o controlador ao TextField
              //   controller: _controller,
              //   decoration: const InputDecoration(
              //     labelText: 'Digite seu nome',
              //     border: OutlineInputBorder(),
              //   ),
              //   // 4. Atualize a variável sempre que o texto mudar
              //   onChanged: (valor) {
              //     setState(() {
              //       _nomeUsuario = valor;
              //     });
              //   },
              // ),              
              // TextField(decoration: InputDecoration(filled: true, fillColor: Colors.red),),
              // TextField(cursorColor: Colors.redAccent, style: TextStyle(color: Colors.blue),),
              // TextField(decoration: InputDecoration(hintStyle: TextStyle(color: Colors.blue), hintText: "Nome do usuário"),),
              // TextField(maxLines: 5,),
              // TextField(keyboardType: TextInputType.datetime,),
              // TextField(keyboardType: TextInputType.emailAddress,),
              // TextField(keyboardType: TextInputType.number,),
              // TextField(keyboardType: TextInputType.phone,),
              // TextField(keyboardType: TextInputType.streetAddress,),
              // TextField(obscureText: true, obscuringCharacter: "*",)
              // TextField(
              //   controller: _dateController, // Controle o texto aqui
              //   readOnly: true, // Bloqueia o teclado comum
              //   decoration: const InputDecoration(
              //     labelText: 'Data de Nascimento',
              //     prefixIcon: Icon(Icons.calendar_today),
              //   ),
              //   onTap: () async {
              //     DateTime? pickedDate = await showDatePicker(
              //       context: context,
              //       initialDate: DateTime.now(),
              //       firstDate: DateTime(1900),
              //       lastDate: DateTime(2100),
              //     );

              //     if (pickedDate != null) {
              //       // Formate como desejar (ex: 10/05/2024)
              //       setState(() {
              //         _dateController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
              //       });
              //     }
              //   },
              // )
            ],
          )
        ),
      ),
    );
  }  

}