import 'package:flutter/material.dart';
import 'package:gabriel_11_05/views/subviews/ex01-subview.dart';

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
      body: Ex01Subview(),
    );
  }
}
