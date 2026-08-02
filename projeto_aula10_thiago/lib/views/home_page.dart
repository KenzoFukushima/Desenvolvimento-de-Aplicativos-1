import 'package:flutter/material.dart';
import 'package:projeto_aula10_thiago/dao/postDAO.dart';
import 'package:projeto_aula10_thiago/models/post.dart';
import 'package:projeto_aula10_thiago/models/story.dart';
import 'package:projeto_aula10_thiago/views/add_post.dart';
import 'package:projeto_aula10_thiago/views/add_story.dart';
import 'package:projeto_aula10_thiago/views/post_item.dart';
import 'package:projeto_aula10_thiago/views/story_item.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final List<Story> _stories = [
    Story(title: 'Story 1'),
    Story(title: 'Story 2'),
    Story(title: 'Story 3'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    deletedPost(Post post) {
      setState(() {
        PostDao.instance.remove(post);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Style APP'),
      ),
      body: Column(
        children: [

          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _stories.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return TextButton(
                    onPressed: () async {
                      final resultStory = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddStory(),
                        ),
                      );

                      if (resultStory != null && resultStory is Story) {
                        setState(() {
                          _stories.add(
                            resultStory,
                          );
                        });
                      }
                    },
                    child: Stack(
                      children: <Widget> [
                        Container(
                          height: size.height * 0.12,
                          width: size.height * 0.12,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: size.height * 0.03,
                            width: size.height * 0.03,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                              border: Border.all(color: Colors.white, width: 2)
                          ),
                          child: Icon(Icons.add, color: Colors.white,),
                        )),
                      ],
                    ),
                  );
                }

                final story = _stories[index - 1];
                return GestureDetector(
                  onTap: () {
                    if (!story.view) {
                      setState(() {
                        story.viewed();
                      });
                    }
                  },
                  child: StoryItem(story: story),
                );
              },
            ),
          ), 


          Expanded(
            child: FutureBuilder(
              future: PostDao.instance.getPosts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!.isEmpty
                      ? const Center(child: Text("Nenhum post"))
                      : ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Post currentPost = snapshot.data![index];
                            return PostItem(
                              post: currentPost,
                              deleteItem: () => deletedPost(currentPost),
                            );
                          },
                        );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPost()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
