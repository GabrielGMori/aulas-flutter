import 'package:flutter/material.dart';
import 'package:gabriel_11_05/models/story.dart';

class StoryItem extends StatefulWidget {
  const StoryItem({super.key, required this.story});

  final Story story;

  @override
  State<StoryItem> createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextButton(
        onPressed: () {
          setState(() {
            widget.story.block();
          });
        },

        style: TextButton.styleFrom(
          backgroundColor: widget.story.blocked ? Theme.of(context).primaryColorDark : widget.story.color,
          shape: CircleBorder(),
          fixedSize: Size(100, 100),
        ),
        
        child: Text(
          widget.story.blocked ? "Bloqueado" : widget.story.text,
          style: TextStyle(
            fontSize: 14,
            color:
                widget.story.blocked || ThemeData.estimateBrightnessForColor(widget.story.color) == Brightness.dark
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
