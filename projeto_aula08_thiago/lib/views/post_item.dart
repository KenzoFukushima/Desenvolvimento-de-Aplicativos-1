  import 'package:flutter/material.dart';
  import 'package:projeto_aula08_thiago/models/post.dart';
import 'package:projeto_aula08_thiago/views/add_post.dart';

  class PostItem extends StatefulWidget {
    final Post post;
    final Function() deleteItem;
    const PostItem({super.key, required this.post, required this.deleteItem});


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
          trailing: Wrap(
            children: [
              IconButton(icon: widget.post.liked ? Icon(Icons.favorite, color: Colors.red,) : Icon(Icons.favorite_border),onPressed: () {
                setState(() {
                  widget.post.like();
                });
              },),
      
              IconButton(onPressed: widget.deleteItem,
              icon: Icon(Icons.delete)),

              IconButton(onPressed: () async {
                await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddPost(post: widget.post))
                );
              }, icon: Icon(Icons.edit)),
            ],
          ),
        ),
      );
    }
  }