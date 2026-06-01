import 'package:flutter/material.dart';
import 'package:projeto_aula08_thiago/views/story_item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List _post = ['post 1', 'post 2', 'post 3'];
  final List _stories = ['story 1', 'story 2', 'story 3', 'story 4', 'story 5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Style APP'),
      ),
      body: Column(
        children: [

          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: _stories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const StoryItem();
              },),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: _post.length,
              itemBuilder: (context, index) {
                return PostItem(text: _post[index],);
            },),
          ),
        ],
      )
    );
  }
}

class PostItem extends StatelessWidget {
  final String text;
  const PostItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 200,
              color: colors.primaryContainer,
              child: Center(child: Text(text, style: TextStyle(fontSize: 20),)),
            ),
          );
  }
}