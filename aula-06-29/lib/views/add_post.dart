import 'package:flutter/material.dart';
import 'package:gabriel_11_05/models/post.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key, this.post});

  final Post? post;

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formFields = {
    'title': 'Título do Post',
    'text': 'Conteúdo do Post',
  };
  final Map<String, TextEditingController> _postControllers = {};

  @override
  void initState() {
    super.initState();
    for (String key in _formFields.keys) {
      _postControllers[key] = TextEditingController();
    }
    if (widget.post != null) {
      _postControllers['title']!.text = widget.post!.title;
      _postControllers['text']!.text = widget.post!.text;
    }
  }

  @override
  void dispose() {
    super.dispose();
    for (String key in _formFields.keys) {
      _postControllers[key]!.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.post == null
            ? const Text("Novo Post")
            : const Text("Editando Post"),
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
              for (var key in _formFields.keys)
                TextFormField(
                  controller: _postControllers[key],
                  decoration: InputDecoration(labelText: _formFields[key]),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Este campo é obrigatório";
                    }
                    return null;
                  },
                ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text("Salvando")));
                    if (widget.post == null) {
                      Navigator.pop(context, [
                        Post(
                          title: _postControllers['title']!.value.text,
                          text: _postControllers['text']!.value.text,
                        ),
                      ]);
                      return;
                    }

                    widget.post?.title = _postControllers['title']!.value.text;
                    widget.post?.text = _postControllers['text']!.value.text;
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
