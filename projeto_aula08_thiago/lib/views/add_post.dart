import 'package:flutter/material.dart';
import 'package:projeto_aula08_thiago/models/post.dart';

class AddPost extends StatefulWidget {
  final Post? post;
  const AddPost({super.key, this.post});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  
  
  @override
  void initState() {
    super.initState();
    if (widget.post != null) {
      _titleController.text = widget.post!.title;
      _textController.text = widget.post!.text;
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: widget.post == null ? const Text("Novo Post") : const Text("Editando Post"),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: 'Title'
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite o title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _textController,
                decoration: const InputDecoration(
                  hintText: 'Text',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite o text';
                  }
                  return null;
                },  
              ),

              SizedBox(
                height: size.height * 0.01,
              ),

              ElevatedButton(onPressed: () {
                if (_formkey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Salvando"))
                  );
                  if (widget.post == null) {
                    Post newPost = Post(title: _titleController.text, text: _textController.text);
                    Navigator.pop(context, [newPost]);
                  } else {
                    widget.post?.title = _titleController.text;
                    widget.post?.text = _textController.text;
                    Navigator.pop(context);
                  }
                }
              }, child: const Text('Salvar'),),
            ],
          ),
        ),
      ),
    );
  }
}