import 'package:flutter/material.dart';

class Reescrita extends StatefulWidget {
  const Reescrita({super.key});

  @override
  State<Reescrita> createState() => _ReescritaState();
}

class _ReescritaState extends State<Reescrita> {

  String text = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                decoration: InputDecoration(
                  labelText: 'Digite algo',
                ),
                onChanged: (value) {
                  setState(() {
                    text = value;
                  });
                },
              ),
          
              SizedBox(height: size.height * 0.02),
          
              Text(text),
            ],
          
          ),
        ), 
      ); 
    }
}