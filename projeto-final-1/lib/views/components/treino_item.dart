import 'package:flutter/material.dart';
import 'package:gabrel_projeto_flutter/models/treino.dart';

class TreinoItem extends StatefulWidget {
  const TreinoItem({
    super.key,
    required this.treino,
    required this.onRealizado,
    required this.onEdit,
    required this.onDelete,
  });

  final Treino treino;

  final void Function(Treino) onRealizado;
  final void Function(Treino) onEdit;
  final void Function(Treino) onDelete;

  @override
  State<TreinoItem> createState() => _TreinoItemState();
}

class _TreinoItemState extends State<TreinoItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.primaryContainer,
      contentPadding: EdgeInsets.fromLTRB(10, 5, 5, 10),

      title: Text(widget.treino.nome),
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      ),

      leading: Icon(
        widget.treino.realizado
            ? Icons.check_box_outlined
            : Icons.check_box_outline_blank,
        size: 30,
        color: Theme.of(context).colorScheme.primary,
      ),

      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          spacing: 10,
          children: [
            Column(
              children: [
                Text('Exercícios', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.treino.exercicios.toString()),
              ],
            ),
            Column(
              children: [
                Text(
                  'Sets totais',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  (widget.treino.exercicios * widget.treino.setsPorExercicio)
                      .toString(),
                ),
              ],
            ),
          ],
        ),
      ),

      trailing: Wrap(
        children: [
          IconButton(
            onPressed: () => widget.onEdit(widget.treino),
            icon: Icon(Icons.edit, size: 20),
          ),
          IconButton(
            onPressed: () => widget.onDelete(widget.treino),
            icon: Icon(Icons.delete, size: 20),
          ),
        ],
      ),

      onTap: () {
        setState(() {
          widget.treino.toggleRealizado();
          widget.onRealizado(widget.treino);
        });
      },
    );
  }
}
