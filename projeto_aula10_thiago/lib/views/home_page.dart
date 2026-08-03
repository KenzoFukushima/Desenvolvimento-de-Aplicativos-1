import 'package:flutter/material.dart';
import 'package:projeto_aula10_thiago/dao/postDAO.dart';
import 'package:projeto_aula10_thiago/models/post.dart';
import 'package:projeto_aula10_thiago/models/story.dart';
import 'package:projeto_aula10_thiago/views/add_post.dart';
import 'package:projeto_aula10_thiago/views/add_story.dart';
import 'package:projeto_aula10_thiago/views/post_item.dart';
import 'package:projeto_aula10_thiago/views/story_item.dart';
import 'package:projeto_aula10_thiago/dao/storyDAO.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // REMOVER a lista fixa _stories

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    deletedPost(Post post) {
      setState(() {
        PostDao.instance.remove(post);
      });
    }

    deleteStory(Story story) {
      setState(() {
        StoryDao.instance.remove(story);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram Style APP'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: FutureBuilder(
              future: StoryDao.instance.getStories(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Story> stories = snapshot.data!;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: stories.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return TextButton(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const AddStory()),
                            );
                            setState(() {});
                          },
                          child: Stack(
                            children: <Widget>[
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
                                    border: Border.all(color: Colors.white, width: 2),
                                  ),
                                  child: const Icon(Icons.add, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      final story = stories[index - 1];
                      return StoryItem(
                        story: story,
                        deleteItem: () => deleteStory(story),
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