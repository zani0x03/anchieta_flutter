import 'package:flutter/material.dart';

class BotaoCadastrar extends StatelessWidget {
  final VoidCallback onPressed;

  const BotaoCadastrar({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Text('Cadastrar'),
    );
  }
}