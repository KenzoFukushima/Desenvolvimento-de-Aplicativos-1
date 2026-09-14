import 'package:flutter/material.dart';
import 'package:projeto_aula10_thiago/dao/postDao.dart';
import 'package:projeto_aula10_thiago/models/post.dart';

class CommentePost extends StatefulWidget {
  final Post post;

  const CommentePost({super.key, required this.post});

  @override
  State<CommentePost> createState() => _CommentePostState();
}

class _CommentePostState extends State<CommentePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comentários'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text(
                  widget.post.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(widget.post.text),
                leading: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.post.like();
                    });
                    PostDao.instance.update(widget.post);
                  },
                  icon: widget.post.liked
                      ? const Icon(Icons.favorite, color: Colors.red)
                      : const Icon(Icons.favorite_border),
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
      bottomNavigationBar: Text("Barra para adiconar comentario"),
    );
  }
}
