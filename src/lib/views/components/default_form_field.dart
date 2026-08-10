import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool isNumber;
  final bool required;

  const DefaultFormField({
    super.key,
    required this.label,
    required this.controller,
    this.isNumber = false,
    this.required = true,
  });

  String? _validator(String? value) {
    return value!.isEmpty ? "Este campo é obrigatório" : null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      controller: controller,
      validator: required ? _validator : null,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      inputFormatters: isNumber
          ? [FilteringTextInputFormatter.digitsOnly]
          : null,
    );
  }
}
