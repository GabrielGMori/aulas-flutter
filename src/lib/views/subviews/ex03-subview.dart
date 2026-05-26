import 'package:flutter/material.dart';

// Crie uma tela que inclua um TextField onde o que o usuário digita aparece em um
// Text embaixo em tempo real. Você precisará utilizar a propriedade onChanged.

class Ex03Subview extends StatelessWidget {
  const Ex03Subview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(20), child: TextEmTempoReal());
  }
}

class TextEmTempoReal extends StatefulWidget {
  const TextEmTempoReal({super.key});

  @override
  State<TextEmTempoReal> createState() => _TextEmTempoRealState();
}

class _TextEmTempoRealState extends State<TextEmTempoReal> {
  final TextEditingController _controller = TextEditingController();
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Texto em tempo real',
          ),
          onChanged: (value) => setState(() {
            text = value;
          }),
        ),
        Text(text),
      ],
    );
  }
}
