import 'package:flutter/material.dart';

class GradeHoraria extends StatelessWidget {
  const GradeHoraria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grade Horária'),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer, centerTitle: true,),
      body: Column(
        children: [
          Componente(nome: 'Desenvolvimento de Aplicativos'),
          Componente(nome: 'Desenvolvimento Web II'),
          Componente(nome: 'Matemática'),
        ],
      ),
    );
  }
}

class Componente extends StatefulWidget {
  
  final String nome;

  const Componente({super.key, required this.nome});

  @override
  State<Componente> createState() => _ComponenteState();
}

class _ComponenteState extends State<Componente> {
  int aulas = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.school),
        Expanded(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
            child: Text(widget.nome.toUpperCase()),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              aulas++;
            });
          },
          child: Text('$aulas aulas'),
        ),
      ],
    );
  }
}