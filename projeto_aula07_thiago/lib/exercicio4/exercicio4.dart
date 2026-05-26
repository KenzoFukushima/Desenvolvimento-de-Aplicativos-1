import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projeto_aula07_thiagos/exercicio4/telas/exercicio1.dart';
import 'package:projeto_aula07_thiagos/exercicio4/telas/exercicio2.dart';
import 'package:projeto_aula07_thiagos/exercicio4/telas/exercicio3.dart';

class Exercicio4 extends StatefulWidget {
  const Exercicio4({super.key});

  @override
  State<Exercicio4> createState() => _Exercicio4State();
}

class _Exercicio4State extends State<Exercicio4> {
  int paginaAtual = 0;

  final List<Widget> paginas = [
    ConteudoEx4(),
    Exercicio1(),
    Exercicio2(),
    Exercicio3(),
    
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercicio 4'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: paginas[paginaAtual],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: colors.primary,
        selectedItemColor: colors.onPrimary,
        unselectedItemColor: colors.onPrimaryContainer,
        currentIndex: paginaAtual,
        onTap: (value) {
          setState(() {
            paginaAtual = value;
          });
        },
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.plus_one),
          label: 'Ex 1',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.accessibility_new_rounded),
          label: 'Ex 2',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.abc_outlined),
          label: 'Ex 3',
        ),
      ]),
    );
  }
}

class ConteudoEx4 extends StatelessWidget {
  const ConteudoEx4({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Conteudo do Exercicio 4'),
          
          Lottie.asset('assets/animation/Sushi.json'),
        ],
      ),
    );
  }
}

