import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timeline', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.scrim,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.scrim,

        child: ListView(
          children: const [
            DrawerHeader(
              child: Text('Menu', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('teste')],
        ),
      ),
    );
  }
}
