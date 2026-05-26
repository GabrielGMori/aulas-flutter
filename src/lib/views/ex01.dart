import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Crie uma tela com duas caixas de texto e um botão para somar. Ao inserir dois
// valores numéricos e clicar no botão, deve ser apresentado o resultado da soma na
// mesma tela.Utilize o widget TextField e verifique como alterar o teclado para aceitar
// somente valores numéricos.

class Ex01 extends StatelessWidget {
  const Ex01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercício 1"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
      ),
      body: Padding(padding: const EdgeInsets.all(20), child: Somador()),
    );
  }
}

class Somador extends StatefulWidget {
  const Somador({super.key});

  @override
  State<Somador> createState() => _SomadorState();
}

class _SomadorState extends State<Somador> {
  final List<String> _formFields = ['Número 1', 'Número 2'];
  final Map<String, TextEditingController> _controllers = {};

  String _somaString = '';

  String somarStrings(String num1, String num2) {
    if (num1.isEmpty || num2.isEmpty) {
      return "Por favor, preencha todos os campos";
    }
    return (int.parse(num1) + int.parse(num2)).toString();
  }

  @override
  void initState() {
    super.initState();
    for (String formField in _formFields) {
      _controllers[formField] = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 20,
      children: [
        for (String formField in _formFields)
          TextField(
            controller: _controllers[formField],
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: formField,
            ),
          ),
        IconButton.filled(
          onPressed: () {
            setState(
              () => _somaString = somarStrings(
                _controllers['Número 1']?.text ?? '',
                _controllers['Número 2']?.text ?? '',
              ),
            );
          },
          icon: Icon(Icons.add),
        ),
        Text(_somaString),
      ],
    );
  }
}
