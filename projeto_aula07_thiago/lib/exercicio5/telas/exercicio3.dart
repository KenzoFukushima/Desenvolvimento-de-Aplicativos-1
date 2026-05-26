import 'package:flutter/material.dart';

class Exercicio3 extends StatefulWidget {
  const Exercicio3({super.key});

  @override
  State<Exercicio3> createState() => _ReescritaState();
}

class _ReescritaState extends State<Exercicio3> {

  String text = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
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