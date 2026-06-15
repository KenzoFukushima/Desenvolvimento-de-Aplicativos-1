import 'package:flutter/material.dart';
import 'package:projeto_aula08_thiago/models/post.dart';

class PostItem extends StatefulWidget {
  final Post post;
  const PostItem({super.key, required this.post});

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.post.title),
        subtitle: Text(widget.post.text),
        trailing: IconButton(icon: widget.post.liked ? Icon(Icons.favorite, color: Colors.red,) : Icon(Icons.favorite_border),onPressed: () {
          setState(() {
            widget.post.like();
          });
        },),
      ),
    );
  }
}