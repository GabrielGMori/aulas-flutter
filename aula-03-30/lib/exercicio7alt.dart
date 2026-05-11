import 'package:flutter/material.dart';

class Exercicio7Alt extends StatelessWidget {
  const Exercicio7Alt({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.white),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: size.height * 0.15,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Olá, este é o exercício 7!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                Icon(Icons.woman, color: Colors.white, size: 40),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Recomendados", style: TextStyle(fontSize: 18)),
                TextButton(
                  onPressed: null,
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primaryContainer,
                  ),
                  child: Text(
                    "Mais",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
              scrollDirection: Axis.vertical,
              children: [
                for (int i = 0; i < 4; i++)
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Image.asset(
                      'assets/img/tijolo.png',
                      width: size.width * 0.4,
                    ),
                  ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            child: Text("Desenvolvimento de Aplicativos"),
          ),
        ],
      ),
    );
  }
}
