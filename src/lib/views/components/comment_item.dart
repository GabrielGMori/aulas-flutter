import 'package:flutter/material.dart';
import 'package:gabriel_11_05/models/comment.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red, child: Text('sdfds'),);
  }
}