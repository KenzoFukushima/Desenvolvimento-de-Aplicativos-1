import 'package:flutter/material.dart';

class Exercicio1 extends StatelessWidget {
  const Exercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Exercício 1")),
        backgroundColor: Colors.green[200],
      ),
      body: Padding(
        padding: const EdgeInsetsGeometry.fromLTRB(8, 0, 8, 0),
        child: Column(
          children: [
            const Text('Bem-Vindo, usúario!'),
            Image.asset('assets/mascote_flutter.png'),
          ],
        ),
      ),
    );
  }
}
