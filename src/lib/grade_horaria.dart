import 'package:flutter/material.dart';
import 'package:gabriel_11_05/componente.dart';

class GradeHoraria extends StatelessWidget {
  const GradeHoraria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grade Horária"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Componente(nome: "Desenvolvimento de Aplicativos"),
          Componente(nome: "Desenvolvimento Web II"),
          Componente(nome: "Matemática III"),
        ],
      ),
    );
  }
}
