import 'package:flutter/material.dart';
import 'package:gabriel_11_05/models/story.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({super.key, required this.story, required this.onPressed});

  final Story story;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: story.color,
          shape: CircleBorder(),
          fixedSize: Size(100, 100),
        ),
        child: story.icon != null
            ? Icon(story.icon, size: 35)
            : Text(
                story.text ?? "",
                style: TextStyle(
                  fontSize: 20,
                  color:
                      ThemeData.estimateBrightnessForColor(story.color) ==
                          Brightness.dark
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
