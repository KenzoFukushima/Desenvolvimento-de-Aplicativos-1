import 'package:flutter/material.dart';

class Receita extends StatelessWidget {
  const Receita({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receita de Bolo de Cenoura'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Imagem da Receita
            SizedBox(
              height: size.height * 0.3,
              child: Image.asset(
                'assets/images/bolo_cenoura.jpg', // Verifique o caminho de imagem
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // Pontuação da Receita (Row de estrelas)
            Row(
              children: [
                for (int i = 0; i < 4; i++)
                  Icon(Icons.star, color: colorScheme.primary, size: 24),
                Icon(
                  Icons.star_half,
                  color: colorScheme.primary,
                  size: 24,
                ), // Meia estrela
                SizedBox(width: 8),
                Text('4.5 (250 avaliações)', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),

            Section(title: 'Ingredientes: ',
            itens: [
              'Cenouras, Ovos, Óleo, Açucar e Farinha',
              'Cobertura: chocolate'
            ], numerado: true,),

            SizedBox(height: 20),

            Section(title: 'Modo de Preparo: ', 
            itens: [
              'Bata canoura, ovos e óleo no liquidificador.',
              'Mistura os liquidos com açucar e farinha. Adicione o fermento por último',
              'Asse em forno médio (180ºC)'
            ], numerado: true,)
          ],
        ),
      ),
    );
  }
}


class Section extends StatelessWidget {
  
  final String title;
  final List<String> itens;
  final bool numerado;

  const Section({super.key, required this.title, required this.itens, this.numerado=false});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return // Seção de Ingredientes
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.tertiary,
                  ),
                ),

                const SizedBox(height: 10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for(int i = 0; i < itens.length; i++)
                      Item(icon: Icons.square, text: itens[i], numerado: numerado, index: i+1,)
                  ],
                )

              ],
            );
  }
}

class Item extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool numerado;
  final int? index;
  const Item({super.key, required this.icon, required this.text,this.numerado = false, this.index});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [

        numerado?
          Text("${index}.", style: TextStyle(fontWeight: FontWeight.bold, color: colorScheme.primary),)
        : Icon(icon, size: 8, color: colorScheme.primary,),

        SizedBox(width: 4),
        Expanded(child: Text(text)),
      ],
    );
  }
}


