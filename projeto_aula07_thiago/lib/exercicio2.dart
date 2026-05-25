import 'package:flutter/material.dart';

class Exercicio2 extends StatelessWidget {
  const Exercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercicio 2'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Saudacao(),
    );
  }
}

class Saudacao extends StatefulWidget {
  const Saudacao({super.key});

  @override
  State<Saudacao> createState() => _SaudacaoState();
}

class _SaudacaoState extends State<Saudacao> {
  String nome = '';
  String sentimento = '';
  bool mostrar = false;
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
      
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    mostrar = true;
                    return 'Digite seu nome';
                  }
                  return null;
                },
      
                onChanged: (value) {
                  nome = value;
                },
          ),
      
          SizedBox(
            height: size.height * 0.02,
          ),
      
          TextFormField(
                decoration: InputDecoration(
                  labelText: 'Como está se Sentindo',
                  border: OutlineInputBorder(),
                ),
      
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    mostrar = true;
                    return 'Digite seu nome';
                  }
                  return null;
                },
      
                onChanged: (value) {
                  nome = value;
                },
              ),
            
          if(mostrar)
            Image.asset('assets/image/Emotions.webp')
        ],
      ),
    );
  }
}
