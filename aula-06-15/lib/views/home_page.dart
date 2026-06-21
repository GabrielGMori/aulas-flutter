import 'package:flutter/material.dart';
import 'package:gabriel_11_05/models/post.dart';
import 'package:gabriel_11_05/models/story.dart';
import 'package:gabriel_11_05/views/add_post.dart';
import 'package:gabriel_11_05/views/add_story.dart';
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
      title: "Novidades no Flutter 2026",
      text:
          "O ecossistema mobile não para de evoluir. As novas atualizações de renderização deixaram as animações ainda mais fluidas e o consumo de bateria muito menor!",
    ),
    Post(
      title: "Café da Manhã Perfeito",

      text:
          "Nada supera começar o dia com um bom café coado na hora e uma torrada quentinha. Qual é a sua rotina matinal favorita?",
    ),
    Post(
      title: "Dica de Produtividade",
      text:
          "Mantenha o foco eliminando as distrações digitais. Experimente a técnica Pomodoro: 25 minutos de trabalho intenso por 5 minutos de descanso.",
    ),
    Post(
      title: "Destino dos Sonhos",
      text:
          "Planejando a próxima viagem! Alguém aí já visitou o Japão na época das cerejeiras? Aceito dicas de roteiros e restaurantes.",
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
                return StoryItem(
                  story: index == 0
                      ? Story(
                          icon: Icons.add,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        )
                      : _stories[index - 1],
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => index == 0
                            ? const AddStory()
                            : AddStory(
                                currentText: _stories[index - 1].text ?? "",
                                currentColor: _stories[index - 1].color,
                              ),
                      ),
                    );
                    if (result != null) {
                      setState(() {
                        if (index == 0) {
                          _stories.add(result[0]);
                        } else {
                          _stories[index - 1] = result[0];
                        }
                      });
                    }
                  },
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: PostItem(post: _posts[index]),
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
