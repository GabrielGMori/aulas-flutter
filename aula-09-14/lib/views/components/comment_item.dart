import 'package:flutter/material.dart';
import 'package:gabriel_11_05/models/comment.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(
          Icons.person,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
        tileColor: Theme.of(context).colorScheme.secondaryContainer,
        title: Text(comment.text),
        titleTextStyle: TextStyle(
          fontSize: 16,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}
