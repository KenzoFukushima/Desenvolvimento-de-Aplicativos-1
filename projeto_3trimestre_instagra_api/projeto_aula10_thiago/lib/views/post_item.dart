import 'package:flutter/material.dart';
import 'package:projeto_aula10_thiago/dao/postDAO.dart';
import 'package:projeto_aula10_thiago/models/post.dart';
import 'package:projeto_aula10_thiago/views/add_post.dart';
import 'package:projeto_aula10_thiago/views/commente_post.dart';

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
      return GestureDetector(

        onTap: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (context) => CommentePost(post: widget.post)),
          );
        },
        child: Card(
          child: ListTile(
            title: Text(widget.post.title),
            subtitle: Text(widget.post.text),
            trailing: Wrap(
              children: [
                IconButton(
                  icon: widget.post.liked
                      ? const Icon(Icons.favorite, color: Colors.red)
                      : const Icon(Icons.favorite_border),
                  onPressed: () {
                    setState(() {
                      widget.post.like();
                    });
                    PostDao.instance.update(widget.post);
                  },
                ),
        
                IconButton(onPressed: widget.deleteItem,
                icon: Icon(Icons.delete)),
        
                IconButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddPost(post: widget.post)),
                    );
                    setState(() {});
                  },
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }