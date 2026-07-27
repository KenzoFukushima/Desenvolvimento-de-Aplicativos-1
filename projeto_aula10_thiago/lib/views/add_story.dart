import 'package:flutter/material.dart';

class AddStory extends StatefulWidget {
  const AddStory({super.key});

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

            ElevatedButton(onPressed: () {
                if (_formkey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Salvando"))
                  );

                  Navigator.pop(context, _titleController.text);
                }
              }, child: const Text('Salvar'),),
          ],
        ), 
      ),
    );
  }
}