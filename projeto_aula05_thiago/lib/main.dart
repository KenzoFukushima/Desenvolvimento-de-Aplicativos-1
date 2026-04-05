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
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 107, 226, 38),
        ),
      ),
      home: const Exercicio7(),
    );
  }
}

class Exercicio1 extends StatelessWidget {
  const Exercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Exercicio 1")),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsetsGeometry.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Bem vindo, Usuario!"),
            Image.asset('assets/mascote_flutter.png'),
          ],
        ),
      ),
    );
  }
}

class Exercicio2 extends StatelessWidget {
  const Exercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Exercicio 2')),
        backgroundColor: const Color.fromARGB(255, 111, 207, 171),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Dash',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 40),
            Image.asset('assets/mascote_flutter.png', height: 480),

            const SizedBox(height: 40),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.star, size: 40),
                Icon(Icons.star, size: 40),
                Icon(Icons.star, size: 40),
                Icon(Icons.star, size: 40),
                Icon(Icons.star_outline_outlined, size: 40),
              ],
            ),

            const SizedBox(height: 60),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: () {}, child: const Text('Anterior')),
                  TextButton(onPressed: () {}, child: const Text('Próximo')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Exercicio3 extends StatelessWidget {
  const Exercicio3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Exercicio 2')),
        backgroundColor: const Color.fromARGB(255, 111, 207, 171),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Dash',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 40),
            Image.asset('assets/mascote_flutter.png', height: 480),

            const SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.star, size: 40),
                  Icon(Icons.star, size: 40),
                  Icon(Icons.star, size: 40),
                  Icon(Icons.star, size: 40),
                  Icon(Icons.star_outline_outlined, size: 40),
                ],
              ),
            ),

            const SizedBox(height: 60),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 203, 255, 221),
                    ),
                    child: const Text('Anterior'),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 203, 255, 221),
                    ),
                    child: const Text('Próximo'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Exercicio4 extends StatelessWidget {
  const Exercicio4({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ),
        backgroundColor: const Color.fromARGB(255, 82, 161, 96),
      ),
      body: Container(
        height: size.height * 0.15,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 82, 161, 96),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: const Padding(
          padding: EdgeInsetsGeometry.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ola, esse é o Exerciício 4',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.woman, size: 50, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

class Exercicio5 extends StatelessWidget {
  const Exercicio5({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        backgroundColor: const Color.fromARGB(255, 82, 161, 96),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,

        children: [
          Container(
            height: size.height * 0.15,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 82, 161, 96),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: const Text(
                    'Ola, esse é o Exerciício 5',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: const Icon(Icons.woman, size: 50, color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Recomendados'),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 167, 236, 135),
                    padding: const EdgeInsets.all(10),
                  ),
                  child: const Text(' Mais '),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Exercicio6 extends StatelessWidget {
  const Exercicio6({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        backgroundColor: const Color.fromARGB(255, 82, 161, 96),
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.15,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 82, 161, 96),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: const Text(
                    'Ola, esse é o Exerciício 6',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: const Icon(Icons.woman, size: 50, color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Recomendados'),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 167, 236, 135),
                    padding: const EdgeInsets.all(10),
                  ),
                  child: const Text(' Mais '),
                ),
              ],
            ),
          ),

          SizedBox(
            height: size.height * 0.4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  width: size.width * 0.4,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 177, 243, 177),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  margin: const EdgeInsets.all(10),
                  child: Image.asset('assets/mascote_flutter.png'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Exercicio7 extends StatelessWidget {
  const Exercicio7({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.15,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: const Row(
              children: [
                Expanded(
                  child: Text(
                    "Olá, esse é o exercício 7!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Icon(Icons.woman, color: Colors.white, size: 50),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Recomendados'),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 199, 240, 208),
                  ),
                  child: const Text('Mais'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.4,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 199, 240, 208),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  width: size.width * 0.5,
                  margin: const EdgeInsets.all(10),
                  child: Image.asset('assets/mascote_flutter.png'),
                );
              },
            ),
          ),

          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/icon_flutter.png', height: 40),
                const Text("Eu amo o Flutter!", style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Expanded(child: Container()),
          const Center(child: Text('Desenvolvimento de Aplicativo')),
        ],
      ),
    );
  }
}
