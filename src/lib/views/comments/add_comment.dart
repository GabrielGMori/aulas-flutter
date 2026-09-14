import 'package:flutter/material.dart';
import 'package:gabriel_11_05/database/comment_dao.dart';
import 'package:gabriel_11_05/models/comment.dart';
import 'package:gabriel_11_05/models/post.dart';

class AddComment extends StatefulWidget {
  const AddComment({super.key, required this.post});

  final Post post;

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  final _formKey = GlobalKey<FormState>();
  final _commentFieldController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar comentário"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _commentFieldController,
                decoration: InputDecoration(labelText: 'Comentário'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Este campo é obrigatório";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text("Salvando")));

                    String newText = _commentFieldController.text;
                    await CommentDao.add(
                      Comment(text: newText, postId: widget.post.id!),
                    );

                    if (!context.mounted) {
                      return;
                    }

                    Navigator.pop(context);
                  }
                },
                child: Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
