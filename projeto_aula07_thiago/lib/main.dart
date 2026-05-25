import 'package:flutter/material.dart';
import 'package:projeto_aula07_thiagos/exercicio1.dart';
import 'package:projeto_aula07_thiagos/exercicio2.dart';
import 'package:projeto_aula07_thiagos/gradeHoraria.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'stateless widget',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 240, 216, 4))),
      home: Exercicio2(),
    );
  }
}
