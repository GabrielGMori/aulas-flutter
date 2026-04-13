import 'package:flutter/material.dart';
import './exercicio1.dart';
import './exercicio2.dart';
import './exercicio3.dart';
import './exercicio4.dart';
import './exercicio5.dart';
import './exercicio6.dart';
import './exercicio7.dart';
import 'exercicio7alt.dart';

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
      home: const Exercicio1
      (),
      debugShowCheckedModeBanner: false,
    );
  }
}
