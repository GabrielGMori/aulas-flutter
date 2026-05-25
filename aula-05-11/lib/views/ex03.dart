import 'package:flutter/material.dart';
import 'package:gabriel_11_05/views/subviews/ex03-subview.dart';

// Crie uma tela que inclua um TextField onde o que o usuário digita aparece em um
// Text embaixo em tempo real. Você precisará utilizar a propriedade onChanged.

class Ex03 extends StatelessWidget {
  const Ex03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercício 3"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
      ),
      body: Ex03Subview(),
    );
  }
}
