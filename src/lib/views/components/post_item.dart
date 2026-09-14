import 'package:flutter/material.dart';
import 'package:gabriel_11_05/database/post_dao.dart';
import 'package:gabriel_11_05/models/post.dart';
import 'package:gabriel_11_05/views/posts/add_post.dart';
import 'package:gabriel_11_05/views/posts/show_post.dart';

class PostItem extends StatefulWidget {
  const PostItem({super.key, required this.post, required this.deleteItem});

  final Post post;
  final Function() deleteItem;

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        leading: IconButton(
          onPressed: () {
          setState(() {
            widget.post.like();
            PostDao.update(widget.post);
          });
        },
          icon: Icon(
            widget.post.liked ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
            size: 30,
          ),
        ),
        tileColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(widget.post.title),
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
        subtitle: Text(widget.post.text, style: const TextStyle(fontSize: 15)),
        onTap: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (context) => ShowPost(post: widget.post)));
        },
        trailing: Wrap(
          children: [
            IconButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPost(post: widget.post),
                  ),
                );
                setState(() {});
              },
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
            ),
            IconButton(
              onPressed: widget.deleteItem,
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
