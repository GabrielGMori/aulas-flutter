import 'package:flutter/material.dart';
import 'package:gabriel_11_05/database/post_dao.dart';
import 'package:gabriel_11_05/database/story_dao.dart';
import 'package:gabriel_11_05/models/post.dart';
import 'package:gabriel_11_05/models/story.dart';
import 'package:gabriel_11_05/views/add_post.dart';
import 'package:gabriel_11_05/views/components/add_story_button.dart';
import 'package:gabriel_11_05/views/components/post_item.dart';
import 'package:gabriel_11_05/views/components/story_item.dart';
import 'package:path/path.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void deletePost(Post post) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Instagram Style APP"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.surface,
            height: 150,
            child: FutureBuilder(
              future: StoryDao.instance.getStories(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }

                return ListView.builder(
                  itemCount: snapshot.data!.length + 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Story currentStory = snapshot.data![index - 1];
                    if (index == 0) {
                      return AddStoryButton(
                        onAdd: (story) async {
                          setState(() {});
                        },
                      );
                    } else {
                      return StoryItem(story: currentStory);
                    }
                  },
                );
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: PostDao.instance.getPosts(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }

                return snapshot.data!.isEmpty
                    ? const Center(child: Text('Nenhum post encontrado'))
                    : ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Post currentPost = snapshot.data![index];
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: PostItem(
                              post: currentPost,
                              deleteItem: () => {
                                setState(() {
                                  PostDao.instance.remove(currentPost);
                                }),
                              },
                            ),
                          );
                        },
                      );
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
