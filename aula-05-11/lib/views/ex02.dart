import 'package:flutter/material.dart';
import 'package:gabriel_11_05/views/subviews/ex02-subview.dart';

// Crie uma tela que deve pedir o nome do usuário, como ele está se sentindo no
// momento e mostrar uma saudação (Text) e uma imagem. Vamos utilizar um form
// para realizar a validação das caixas de texto (TextFormField). Ou seja, só devem ser
// apresentadas a mensagem de saudação e a imagem caso as caixas de texto sejam
// preenchidas.

class Ex02 extends StatelessWidget {
  const Ex02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercício 2"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
      ),
      body: Ex02Subview(),
    );
  }
}
