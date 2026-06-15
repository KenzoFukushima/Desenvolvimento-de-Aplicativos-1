import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {

  final String text;
  const StoryItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: size.height * 0.12,
        width: size.height * 0.12,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          shape: BoxShape.circle,
        ),
        child: Center(child: Text(text, style: TextStyle(fontSize: 20),)),  
      ),
    );
  }
}