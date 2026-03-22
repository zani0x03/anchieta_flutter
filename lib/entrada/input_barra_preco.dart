import 'package:flutter/material.dart';

class BarradePreco extends StatelessWidget {
  final double valor;
  final Function(double) onChanged;

  const BarradePreco({
    super.key,
    required this.valor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: valor,
      min: 0,
      max: 100,
      divisions: 100,
      label: valor.round().toString(),
      onChanged: onChanged,
    );
  }
}