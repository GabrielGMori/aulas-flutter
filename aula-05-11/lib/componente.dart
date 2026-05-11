import 'package:flutter/material.dart';

class Componente extends StatefulWidget {
  final String nome;

  const Componente({super.key, required this.nome});

  @override
  State<Componente> createState() => _ComponenteState();
}

class _ComponenteState extends State<Componente> {
  int aulas = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.school),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(widget.nome.toUpperCase()),
          ),
        ),
        GestureDetector(
          onTap: () => setState(() => aulas++),
          child: Text('$aulas aulas'),
        ),
      ],
    );
  }
}
