import 'package:flutter/material.dart';
import 'package:gabriel_11_05/models/story.dart';
import 'package:gabriel_11_05/views/add_story.dart';

class AddStoryButton extends StatefulWidget {
  const AddStoryButton({super.key, required this.onAdd});

  final Function(Story story) onAdd;

  @override
  State<AddStoryButton> createState() => _AddStoryButtonState();
}

class _AddStoryButtonState extends State<AddStoryButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: IconButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddStory()),
          );
          if (result != null) {
            widget.onAdd(result[0]);
          }
        },

        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          shape: CircleBorder(),
          fixedSize: Size(100, 100),
        ),
        icon: Icon(Icons.add, size: 35),
      ),
    );
  }
}
