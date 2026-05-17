# projeto07_thiago

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


import 'package:flutter/material.dart';
        child: Column(
          children: [

            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Digite seu nome';
                }
                return null;
              },

              onChanged: (value) {
                nome = value;
              },
            ),

            SizedBox(height: 20),

            TextFormField(
              decoration: InputDecoration(
                labelText: 'Como você está se sentindo?',
                border: OutlineInputBorder(),
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Digite como está se sentindo';
                }
                return null;
              },

              onChanged: (value) {
                sentimento = value;
              },
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {

                if (_formKey.currentState!.validate()) {

                  setState(() {
                    mostrar = true;
                  });
                }
              },

              child: Text('Enviar'),
            ),

            SizedBox(height: 20),

            if (mostrar)
              Column(
                children: [

                  Text(
                    'Olá $nome! Você está se sentindo $sentimento.',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 20),

                  Image.network(
                    'https://cdn-icons-png.flaticon.com/512/742/742751.png',
                    height: 150,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';

class Exercicio3 extends StatefulWidget {
  const Exercicio3({super.key});

  @override
  State<Exercicio3> createState() => _Exercicio3State();
}

class _Exercicio3State extends State<Exercicio3> {

  String texto = '';

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(20),

      child: Column(
        children: [

          TextField(
            decoration: InputDecoration(
              labelText: 'Digite algo',
              border: OutlineInputBorder(),
            ),

            onChanged: (value) {
              setState(() {
                texto = value;
              });
            },
          ),

          SizedBox(height: 20),

          Text(
            texto,
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}









import 'package:flutter/material.dart';
import 'exercicio1.dart';
import 'exercicio2.dart';
import 'exercicio3.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int paginaAtual = 0;

  final List<Widget> paginas = [

    Center(
      child: Lottie.network(
        'https://assets2.lottiefiles.com/packages/lf20_jcikwtux.json',
        height: 250,
      ),
    ),

    Exercicio1(),
    Exercicio2(),
    Exercicio3(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Aula 07'),
      ),

      body: paginas[paginaAtual],

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: paginaAtual,

        onTap: (index) {
          setState(() {
            paginaAtual = index;
          });
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Soma',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Form',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'Texto',
          ),
        ],
      ),
    );
  }
}


dependencies:
  flutter:
    sdk: flutter

  lottie: ^3.1.2
