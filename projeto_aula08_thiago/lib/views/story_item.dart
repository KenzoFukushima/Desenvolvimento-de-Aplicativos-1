import 'package:flutter/material.dart';
import 'package:projeto_aula08_thiago/models/story.dart';

class StoryItem extends StatelessWidget {

  final Story story;
  const StoryItem({super.key, required this.story});

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
          border: Border.all(
            color: story.view ? Theme.of(context).colorScheme.outline : Theme.of(context).colorScheme.primary,
            width: 3
          ),
        ),
        child: Center(child: Text(story.title, style: TextStyle(fontSize: 20),)),  
      ),
    );
  }
}