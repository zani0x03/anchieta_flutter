import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String mensagemRetornada = "Nenhuma resposta ainda";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Olá Flutter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Você está na tela 1', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text(
              'Mensagem retornada: $mensagemRetornada',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final resultado = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const MainAppTela2(vlrRecebido: 'Olá eu vim da tela 1'),
                  ),
                );

                if (resultado != null) {
                  setState(() {
                    mensagemRetornada = resultado;
                  });
                }
              },
              child: Text('Ir para Tela 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class MainAppTela2 extends StatelessWidget {
  final String vlrRecebido;

  const MainAppTela2({super.key, required this.vlrRecebido});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aula Flutter')),
      body: Center(
        child: Column(
          children: [
            const Text('Você está na tela 2', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text('Valor recebido tela 1: $vlrRecebido'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, 'SIM! ✅'),
              child: const Text('Enviar "SIM"'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, 'NÃO! ❌'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[100],
              ),
              child: const Text('Enviar "NÃO"'),
            ),
          ],
        ),
      ),
    );
  }
}