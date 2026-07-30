import 'package:flutter/material.dart';
import 'package:gabriel_11_05/database/story_dao.dart';
import 'package:gabriel_11_05/models/story.dart';
import 'package:gabriel_11_05/views/components/color_picker_input.dart';

class AddStory extends StatefulWidget {
  const AddStory({super.key, this.story});

  final Story? story;

  @override
  State<AddStory> createState() => _AddStoryState();
}

class _AddStoryState extends State<AddStory> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _textController;
  late Color selectedColor = Theme.of(context).colorScheme.inversePrimary;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    if (widget.story != null) {
      _textController.text = widget.story!.text;
      selectedColor = widget.story!.color;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.story == null
            ? const Text("Novo Story")
            : const Text("Editando Story"),
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
            spacing: 20,
            children: [
              TextFormField(
                controller: _textController,
                decoration: InputDecoration(labelText: "Texto do Story"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Este campo é obrigatório";
                  }
                  return null;
                },
              ),
              ColorPickerInput(
                defaultColor: selectedColor,
                onColorChanged: (color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
                label: "Cor do Story",
              ),
              if (widget.story != null)
                CheckboxListTile(
                  value: widget.story!.blocked,
                  onChanged: (value) {
                    setState(() {
                      widget.story!.block();
                    });
                  },
                  title: Text("Bloquear Story"),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (widget.story != null)
                    ElevatedButton(
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Excluindo")),
                        );
                        await StoryDao.instance.remove(widget.story!);

                        if (!context.mounted) {
                          return;
                        }

                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        foregroundColor: Theme.of(context).colorScheme.onError,
                      ),
                      child: Text("Excluir"),
                    ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Salvando")),
                        );
                        
                        String newText = _textController.value.text;
                        if (widget.story == null) {
                          await StoryDao.instance.add(
                            Story(text: newText, color: selectedColor),
                          );
                        } else {
                          widget.story!.text = newText;
                          widget.story!.color = selectedColor;
                          await StoryDao.instance.update(widget.story!);
                        }

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
            ],
          ),
        ),
      ),
    );
  }
}
