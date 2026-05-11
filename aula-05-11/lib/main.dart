import 'package:flutter/material.dart';
import 'package:gabriel_11_05/grade_horaria.dart';
import 'package:gabriel_11_05/views/ex01.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      debugShowCheckedModeBanner: false,
      home: Ex01(),
    );
  }
}
