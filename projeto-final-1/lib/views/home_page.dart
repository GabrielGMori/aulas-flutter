import 'package:flutter/material.dart';
import 'package:gabrel_projeto_flutter/database/treino_dao.dart';
import 'package:gabrel_projeto_flutter/models/treino.dart';
import 'package:gabrel_projeto_flutter/views/components/treino_item.dart';
import 'package:gabrel_projeto_flutter/views/treino_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void onRealizado(Treino treino) async {
    TreinoDao.instance.update(treino);
    setState(() {});
  }

  void onEdit(Treino treino) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TreinoForm(treino: treino)),
    );
    setState(() {});
  }

  void onDelete(Treino treino) async {
    TreinoDao.instance.remove(treino);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Treino removido!"),
        duration: Durations.extralong4,
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        leading: Icon(
          Icons.fitness_center,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        title: Text(
          "Stronger",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Treinos", style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 15),
            Expanded(
              child: FutureBuilder(
                future: TreinoDao.instance.getTreinos(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    );
                  } else if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(
                        "Nenhum treino encontrado",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Treino treino = snapshot.data![index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: TreinoItem(
                          treino: treino,
                          onRealizado: onRealizado,
                          onEdit: onEdit,
                          onDelete: onDelete,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TreinoForm()),
          );
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
