import 'package:flutter/material.dart';
import 'package:projeto_aula07_thiagos/exercicio1/exercicio1.dart';
import 'package:projeto_aula07_thiagos/exercicio2/exercicio2.dart';
import 'package:projeto_aula07_thiagos/exercicio4/exercicio4.dart';
import 'package:projeto_aula07_thiagos/exercicio5/exercicio5.dart';


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
      home: Exercicio5(),
    );
  }
}
