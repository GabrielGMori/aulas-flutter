import 'package:flutter/material.dart';
import 'package:gabriel_11_05/database/comment_dao.dart';
import 'package:gabriel_11_05/models/comment.dart';
import 'package:gabriel_11_05/models/post.dart';
import 'package:gabriel_11_05/views/comments/add_comment.dart';
import 'package:gabriel_11_05/views/components/comment_item.dart';

class PostComments extends StatefulWidget {
  const PostComments({super.key, required this.post});

  final Post post;

  @override
  State<PostComments> createState() => _PostCommentsState();
}

class _PostCommentsState extends State<PostComments> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Comentários',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              IconButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddComment(post: widget.post),
                    ),
                  );
                  setState(() {});
                },
                icon: Icon(Icons.add, size: 30),
              ),
            ],
          ),
          FutureBuilder(
            future: CommentDao.getCommentsByPost(widget.post.id!),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
          
              return snapshot.data!.isEmpty
                  ? Text('Nenhum comentário disponível')
                  : ListView.builder(
                    shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Comment currentComment = snapshot.data![index];
                        return CommentItem(comment: currentComment);
                      },
                    );
            },
          ),
        ],
      ),
    );
  }
}
