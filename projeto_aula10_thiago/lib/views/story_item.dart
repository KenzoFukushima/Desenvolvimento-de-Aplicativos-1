import 'package:flutter/material.dart';
import 'package:projeto_aula10_thiago/dao/storyDAO.dart';
import 'package:projeto_aula10_thiago/models/story.dart';
import 'package:projeto_aula10_thiago/views/add_story.dart';

class StoryItem extends StatefulWidget {
  final Story story;
  final Function() deleteItem;
  const StoryItem({super.key, required this.story, required this.deleteItem});

  @override
  State<StoryItem> createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  void _showOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Editar'),
                onTap: () async {
                  Navigator.pop(context); // fecha o bottom sheet
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddStory(story: widget.story),
                    ),
                  );
                  setState(() {});
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Excluir'),
                onTap: () {
                  Navigator.pop(context); // fecha o bottom sheet
                  widget.deleteItem();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.story.viewed();
          });
          StoryDao.instance.update(widget.story);
        },
        onLongPress: _showOptions,
        child: Container(
          height: size.height * 0.12,
          width: size.height * 0.12,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            shape: BoxShape.circle,
            border: Border.all(
              color: widget.story.view
                  ? Theme.of(context).colorScheme.outline
                  : Theme.of(context).colorScheme.tertiaryFixedDim,
              width: 3,
            ),
          ),
          child: Center(
            child: Text(widget.story.title, style: const TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}