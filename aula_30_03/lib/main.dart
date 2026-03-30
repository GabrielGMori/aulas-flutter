import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 58, 183, 121),
        ),
      ),
      home: const Exercicio3(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Exercicio1 extends StatelessWidget {
  const Exercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercício 1"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            const Text("Bem-vindo, usuário!"),
            Image.asset('assets/img/tijolo.png'),
          ],
        ),
      ),
    );
  }
}

class Exercicio2 extends StatelessWidget {
  const Exercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercício 2"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Tijolito",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Image.asset('assets/img/tijolo.png'),
                  const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.star, size: 30),
                      Icon(Icons.star, size: 30),
                      Icon(Icons.star, size: 30),
                      Icon(Icons.star, size: 30),
                      Icon(Icons.star_border, size: 30),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: null,
                  style: Theme.of(context).textButtonTheme.style,
                  child: Text(
                    "Anterior",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: null,
                  style: Theme.of(context).textButtonTheme.style,
                  child: Text(
                    "Próximo",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Exercicio3 extends StatelessWidget {
  const Exercicio3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercício 3"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Tijolito",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Image.asset('assets/img/tijolo.png'),
                  Container(
                    decoration: BoxDecoration(
                      border: BoxBorder.all(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.star, size: 30),
                        Icon(Icons.star, size: 30),
                        Icon(Icons.star, size: 30),
                        Icon(Icons.star, size: 30),
                        Icon(Icons.star_border, size: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: null,
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primaryContainer,
                  ),
                  child: Text(
                    "Anterior",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: null,
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: Text(
                    "Próximo",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
