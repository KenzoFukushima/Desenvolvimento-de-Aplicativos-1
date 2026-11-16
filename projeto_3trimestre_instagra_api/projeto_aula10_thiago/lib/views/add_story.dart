import 'package:flutter/material.dart';
import 'package:projeto_aula10_thiago/dao/storyDao.dart';
import 'package:projeto_aula10_thiago/models/story.dart';

class AddStory extends StatefulWidget {
  final Story? story;
  const AddStory({super.key, this.story});

  @override
  State<AddStory> createState() => _AddStoryState();
}

class _AddStoryState extends State<AddStory> {

  final _formkey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Story'),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.close))
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Title',
              ),
              validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite o title';
                  }
                  return null;
              },
            ),

            SizedBox(
                height: size.height * 0.01,
            ),

            ElevatedButton(
              onPressed: () async {
                if (_formkey.currentState!.validate()) {
                  if (widget.story == null) {
                    Story newStory = Story(title: _titleController.text);
                    await StoryDao.instance.add(newStory);
                  } else {
                    widget.story!.title = _titleController.text;
                    await StoryDao.instance.update(widget.story!);
                  }

                  if (!context.mounted) {
                    return;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Salvando")),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        ), 
      ),
    );
  }
}