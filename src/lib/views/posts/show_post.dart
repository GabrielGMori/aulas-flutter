import 'package:flutter/material.dart';
import 'package:gabriel_11_05/models/post.dart';
import 'package:gabriel_11_05/views/components/post_comments.dart';

class ShowPost extends StatelessWidget {
  const ShowPost({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(post.title, style: Theme.of(context).textTheme.headlineLarge),
            Text(post.text, style: Theme.of(context).textTheme.bodyLarge),
            Divider(height: 40,),
            PostComments(post: post),
          ],
        ),
      ),
    );
  }
}
