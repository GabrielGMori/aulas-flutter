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
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const Exercicio1(),
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
        title: const Text('Exercício 1'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: const Center(child: Text('Hello World')),
    );
  }
}

class Exercicio2 extends StatelessWidget {
  const Exercicio2({super.key});

  final String nome = 'Gabriel';
  final String sobrenome = 'Mori';

  String _getFullName(String nome, String sobrenome) {
    return '$sobrenome, $nome';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 2'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello World'),
            Text(_getFullName(nome, sobrenome)),
          ],
        ),
      ),
    );
  }
}

class Exercicio3 extends StatelessWidget {
  const Exercicio3({super.key});

  final String nome = 'Gabriel';
  final String sobrenome = 'Mori';

  String _getFullName(String nome, String sobrenome) {
    return '$nome ${sobrenome.toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 3'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            const Text('Hello World'),
            Text(_getFullName(nome, sobrenome)),
          ],
        ),
      ),
    );
  }
}

class Exercicio4 extends StatelessWidget {
  const Exercicio4({super.key});

  final String nome = 'Gabriel';
  final String sobrenome = 'Mori';

  String _getFullName(String nome, String sobrenome) {
    return '$nome ${sobrenome.toUpperCase()}';
  }

  String _formatDate(DateTime data) {
    return '${data.day < 10 ? '0' : ''}${data.day}/${data.month < 10 ? '0' : ''}${data.month}/${data.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 4'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 10,
            children: [
              Text(_getFullName(nome, sobrenome)),
              Text(_formatDate(DateTime.now())),
            ],
          ),
          const Expanded(child: Center(child: Text('Hello World'))),
        ],
      ),
    );
  }
}

class Exercicio5 extends StatelessWidget {
  const Exercicio5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 5'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          spacing: 10,
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
              radius: 25,
              child: Icon(
                Icons.person,
                size: 40,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            const Column(
              spacing: 5,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('Nome'), Text('Telefone')],
            ),
            const Spacer(),
            const Icon(Icons.phone, color: Colors.green, size: 30),
          ],
        ),
      ),
    );
  }
}

class Exercicio6 extends StatelessWidget {
  const Exercicio6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 6'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          child: const Row(
            spacing: 10,
            children: [
              Icon(Icons.search),
              Expanded(child: Text("Pesquisar...")),
            ],
          ),
        ),
      ),
    );
  }
}

class Exercicio7 extends StatelessWidget {
  const Exercicio7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 7'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              child: const Row(
                spacing: 10,
                children: [
                  Icon(Icons.search),
                  Expanded(child: Text("Pesquisar...")),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              spacing: 10,
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.onPrimaryContainer,
                  radius: 25,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
                const Column(
                  spacing: 5,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('Nome'), Text('Telefone')],
                ),
                const Spacer(),
                const Icon(Icons.phone, color: Colors.green, size: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
