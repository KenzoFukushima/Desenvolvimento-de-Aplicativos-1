import 'package:flutter/material.dart';


class Exercicio2 extends StatefulWidget {
  const Exercicio2({super.key});

  @override
  State<Exercicio2> createState() => _SaudacaoState();
}

class _SaudacaoState extends State<Exercicio2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  String nome = '';
  String sentimento = '';
  bool mostrar = false;
  

   void verificarCampos() {

    setState(() {

      mostrar = _formKey.currentState!.validate();

    });

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercicio 2'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome'
                ),
                validator: (value) {
                  if (value==null || value.isEmpty) {
                    return 'Digite seu nome';
                  }
                  return null;
                },
                onChanged: (value) {
                  nome = value;
                  verificarCampos();
                },
              ),

              SizedBox(height: size.height * 0.02),

              TextFormField(

                decoration: const InputDecoration(
                  labelText: 'Como está se sentindo',
                ),

                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return 'Digite seu sentimento';
                  }

                  return null;

                },

                onChanged: (value) {

                  sentimento = value;

                  verificarCampos();

                },
              ),

              SizedBox(height: size.height * 0.02),

              if (mostrar)
                Column(
                  children: [

                    Text(
                      'Olá $nome, você está $sentimento!',
                      style: const TextStyle(fontSize: 20),
                    ),

                    const SizedBox(height: 20),

                    Image.asset(
                      'assets/image/Emotions.webp',
                      height: 200,
                    ),

                  ],
                ),
            ],
        )),
      ),
    ); 
  }
}
