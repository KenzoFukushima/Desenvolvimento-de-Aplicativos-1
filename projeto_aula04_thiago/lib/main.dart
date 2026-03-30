import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 238, 202, 230),
        ),
      ),
      home: const Exercicio6(),
    );
  }
}

class Exercicio1 extends StatelessWidget {
  const Exercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercicio 1"),
        backgroundColor: const Color.fromARGB(255, 202, 180, 200),
      ),
      body: const Center(child: Text("Hello world")),
    );
  }
}

class Exercicio2 extends StatelessWidget {
  const Exercicio2({super.key});

  String _getFullName(String nome, String sobrenome) {
    return '$sobrenome, $nome';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercicio 2"),
        backgroundColor: const Color.fromARGB(255, 202, 180, 200),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Hello world"),
            Text(_getFullName('Thiago', 'Fukushima')),
          ],
        ),
      ),
    );
  }
}

class Exercicio3 extends StatelessWidget {
  const Exercicio3({super.key});

  String _getFullName(String nome, String sobrenome) {
    return '$nome $sobrenome';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercicio 3"),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Hello World"),

            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(_getFullName('Thiago', 'Fukushima')),
            ),
          ],
        ),
      ),
    );
  }
}

class Exercicio4 extends StatelessWidget {
  const Exercicio4({super.key});

  String _getFullName(String nome, String sobrenome) {
    return '$nome $sobrenome';
  }

  String _dataAtual() {
    DateTime data = DateTime.now();
    return '${data.day}/${data.month}/${data.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercicio 4'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_getFullName('thiago', 'fukushima')),

                Text(_dataAtual()),
              ],
            ),
            const Expanded(child: Center(child: Text('Hello World'))),
          ],
        ),
      ),
    );
  }
}

class Exercicio5 extends StatelessWidget {
  const Exercicio5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercicio 5'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Row(
        children: [
          Icon(
            Icons.account_circle,
            size: 80,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('nome'), Text('telefone')],
            ),
          ),
          const Icon(Icons.local_phone, color: Colors.greenAccent),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

class Exercicio6 extends StatelessWidget {
  const Exercicio6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercicio 6'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: const Row(children: [Icon(Icons.search), Text('pesquisa')]),
    );
  }
}
