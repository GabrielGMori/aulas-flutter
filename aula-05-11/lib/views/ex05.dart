import 'package:flutter/material.dart';
import 'package:gabriel_11_05/views/subviews/ex01-subview.dart';
import 'package:gabriel_11_05/views/subviews/ex02-subview.dart';
import 'package:gabriel_11_05/views/subviews/ex03-subview.dart';
import 'package:lottie/lottie.dart';

// Inclua uma animação na HomePage de sua aplicação. Para isso, acesse o site
// https://lottiefiles.com/. Nele você poderá baixar várias animações de forma gratuita.
// Para incluí-las em seu projeto, você precisará baixar o pacote lottie:
// https://pub.dev/packages/lottie.

class Ex05 extends StatelessWidget {
  const Ex05({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Olá, seja bem-vindo!', textAlign: TextAlign.center),
          Lottie.asset('assets/anim/mascot.json'),
        ],
      ),
    );
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
          title: Text("Exercício 5"),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          centerTitle: true,
        ),
        body: currentPage,
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(8),
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
