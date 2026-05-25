import 'package:flutter/material.dart';
import 'package:gabriel_11_05/views/subviews/ex01-subview.dart';
import 'package:gabriel_11_05/views/subviews/ex02-subview.dart';
import 'package:gabriel_11_05/views/subviews/ex03-subview.dart';

// Crie uma HomePage para sua aplicação que deve possuir uma barra de navegação
// na parte inferior da tela contendo 4 ícones. Um ícone deve apresentar a HomePage
// (pode ser vazia por enquanto), e os demais ícones devem apresentar as telas dos
// primeiros 3 exercícios. Nesse caso, é melhor utilizar um único Scaffold para a página
// que contém a navegação; as demais páginas não precisam ter o Scaffold. Pode criar
// uma cópia do arquivo de cada exercício já realizado para remover o Scaffold e
// utilizar nessa atividade.

class Ex04 extends StatelessWidget {
  const Ex04({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  Widget currentPage = HomePage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Exercício 4"),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          centerTitle: true,
        ),
        body: currentPage,
        bottomNavigationBar: Container(
          height: 50,
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () => setState(() => currentPage = HomePage()),
                icon: Icon(Icons.home),
              ),
              IconButton(
                onPressed: () => setState(() => currentPage = Ex01Subview()),
                icon: Icon(Icons.calculate),
              ),
              IconButton(
                onPressed: () => setState(() => currentPage = Ex02Subview()),
                icon: Icon(Icons.handshake),
              ),
              IconButton(
                onPressed: () => setState(() => currentPage = Ex03Subview()),
                icon: Icon(Icons.text_fields),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
