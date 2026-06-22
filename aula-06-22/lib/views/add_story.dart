import 'package:flutter/material.dart';
import 'package:gabriel_11_05/models/story.dart';
import 'package:gabriel_11_05/views/components/color_picker_input.dart';

class AddStory extends StatefulWidget {
  const AddStory({super.key});

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
        title: const Text("Novo Post"),
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
              ColorPickerInput(defaultColor: selectedColor, onColorChanged: (color) {
                setState(() {
                  selectedColor = color;
                });
              }, label: "Cor do Story"),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text("Salvando")));
                    String text = _textController.value.text;
                    Navigator.pop(context, [Story(text: text, color: selectedColor)]);
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
