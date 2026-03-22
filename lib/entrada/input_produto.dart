import 'package:flutter/material.dart';

class InputProduto extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const InputProduto({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Digite o nome do produto',
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}