import 'package:flutter/material.dart';

class Exercicio1 extends StatelessWidget {
  const Exercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercício 1'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Somar()
    );
  }
}

class Somar extends StatefulWidget {


  const Somar({super.key});

  @override
  State<Somar> createState() => _SomarState();
}

class _SomarState extends State<Somar> {
  double numero1 = 0;
  double numero2 = 0;
  double resultado = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'valor 1'
          ),
          onChanged: (value) {
            numero1 = double.tryParse(value) ?? 0;
          },
        ),

        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'valor 2'
          ),
          onChanged: (value) {
            numero2 = double.tryParse(value) ?? 0;
          },
        ),

        TextButton(onPressed: () {
          setState(() {
            resultado = numero1+numero2;
          });
        }, child: Text('Somar'),
        ),
        Text('Resultado: $resultado')
      ],
    );
  }
}