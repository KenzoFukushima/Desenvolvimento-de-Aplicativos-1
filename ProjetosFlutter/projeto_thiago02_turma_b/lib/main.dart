import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 231, 197, 4)),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _contRandom = 0;

  final _listaMensagemBiscoito = [
    "A sorte favorece a mente preparada",
    "Podemos escolher o que semear, mas somos obrigados a colher o que plantamos.",
    "O bom-senso vai mais longe do que muito conhecimento.",
    "Quem quer colher rosas deve suportar os espinhos.",
    "O riso é a menor distância entre duas pessoas."
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _numeroAleatorio();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;

      // if (_counter >= _listaMensagemBiscoito.length) {
      //   _counter=0;
      // }
    });
    
  }

  void _numeroAleatorio() {
      setState(() {
        _contRandom = Random().nextInt(_listaMensagemBiscoito.length);
      });

  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: .center,
          children: [
            const Text('Você abriu seu biscoito da sorte:'),
            Text(
              _listaMensagemBiscoito[_contRandom],
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _numeroAleatorio,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
