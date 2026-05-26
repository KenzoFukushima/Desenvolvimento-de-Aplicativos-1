import 'package:flutter/material.dart';

class Exercicio1 extends StatefulWidget {


  const Exercicio1({super.key});

  @override
  State<Exercicio1> createState() => _SomarState();
}

class _SomarState extends State<Exercicio1> {
  double numero1 = 0;
  double numero2 = 0;
  double resultado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercicio 3'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
            }, style: TextButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primaryContainer), child: Text('Somar'),
            ),
            Text('Resultado: $resultado')
          ],
        ),
      ),
    );
  }
}