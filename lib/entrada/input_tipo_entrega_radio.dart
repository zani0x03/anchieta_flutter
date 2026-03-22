import 'package:flutter/material.dart';

class TipoEntregaRadio extends StatelessWidget {
  final String? valorSelecionado;
  final Function(String?) onChanged;

  const TipoEntregaRadio({
    super.key,
    required this.valorSelecionado,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          value: 'Retirada',
          groupValue: valorSelecionado,
          onChanged: onChanged,
        ),
        const Text("Retirada"),

        Radio<String>(
          value: 'Entrega',
          groupValue: valorSelecionado,
          onChanged: onChanged,
        ),
        const Text("Entrega"),
      ],
    );
  }
}