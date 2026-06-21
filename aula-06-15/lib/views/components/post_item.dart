import 'package:flutter/material.dart';
import 'package:gabriel_11_05/models/post.dart';

class PostItem extends StatefulWidget {
  const PostItem({super.key, required this.post});

  final Post post;

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.primaryContainer,
      contentPadding: EdgeInsets.fromLTRB(8,1,8,10),
      titleAlignment: ListTileTitleAlignment.bottom,
      title: Text(
        widget.post.title,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(widget.post.text, style: const TextStyle(fontSize: 15)),
      trailing: IconButton(
        onPressed: () {
          setState(() {
            widget.post.like();
          });
        },
        icon: Icon(
          widget.post.liked ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
          size: 30,
        ),
      ),
    );
  }
}
