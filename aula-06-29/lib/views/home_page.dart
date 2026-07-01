import 'package:flutter/material.dart';
import 'package:gabriel_11_05/models/post.dart';
import 'package:gabriel_11_05/models/story.dart';
import 'package:gabriel_11_05/views/add_post.dart';
import 'package:gabriel_11_05/views/add_story.dart';
import 'package:gabriel_11_05/views/components/add_story_button.dart';
import 'package:gabriel_11_05/views/components/post_item.dart';
import 'package:gabriel_11_05/views/components/story_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Post> _posts = [
    Post(
      title: "Novidades",
      text:
          "O ecossistema mobile não para de evoluir.",
    ),
    Post(
      title: "Café da Manhã",

      text:
          "Nada supera começar o dia com um bom café coado na hora e uma torrada quentinha.",
    ),
    Post(
      title: "Dicas",
      text:
          "Mantenha o foco eliminando as distrações digitais.",
    ),
    Post(
      title: "Destino dos Sonhos",
      text:
          "Alguém aí já visitou o Japão na época das cerejeiras?",
    ),
  ];

  final List<Story> _stories = [];

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
            child: ListView.builder(
              itemCount: _stories.length + 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return AddStoryButton(
                    onAdd: (story) {
                      setState(() {
                        _stories.add(story);
                      });
                    },
                  );
                } else {
                  return StoryItem(story: _stories[index - 1]);
                }
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: PostItem(post: _posts[index], deleteItem: () => {
                    setState(() {
                      _posts.removeAt(index);
                    })
                  }),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPost()),
          );
          if (result != null) {
            setState(() {
              _posts.add(result[0]);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
