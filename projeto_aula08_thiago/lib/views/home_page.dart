import 'package:flutter/material.dart';
import 'package:projeto_aula08_thiago/models/post.dart';
import 'package:projeto_aula08_thiago/views/add_post.dart';
import 'package:projeto_aula08_thiago/views/story_item.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Post> _post = [
    Post(title: 'Título 1', text: 'post 1'),
    Post(title: 'Título 2', text: 'post 2'),
    Post(title: 'Título 3', text: 'post 3'),
  ];

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
                return StoryItem(text: _stories[index]);
              },),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: _post.length,
              itemBuilder: (context, index) {
                return PostItem(post: _post[index]);
            },),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final result  = await Navigator.push(context, 
          MaterialPageRoute(builder: (context) => const AddPost(),
          
          )
        );
        if (result != null && result is Post) {
          setState(() {
            _post.add(result);
          });
        }
      },
      child: const Icon(Icons.add),),
    );
  }
}

class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 200,
              color: colors.primaryContainer,
              child: Center(child: Text(post.text, style: TextStyle(fontSize: 20),)),
            ),
          );
  }
}