import 'package:flutter/material.dart';

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
  late TextEditingController _controllerNum1;

  @override
  void initState() {
    super.initState();
    _controllerNum1 = TextEditingController();
  }

  @override 
  void dispose() {
    _controllerNum1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 20,
      children: [
        TextField(
          controller: _controllerNum1,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Número 1",
          ),
        ),
        TextField(
          controller: _controllerNum1,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Número 2",
          ),
        ),
        IconButton.filled(onPressed: () {}, icon: Icon(Icons.add)),
      ],
    );
  }
}
