import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gabrel_projeto_flutter/database/treino_dao.dart';
import 'package:gabrel_projeto_flutter/models/treino.dart';
import 'package:gabrel_projeto_flutter/views/components/default_form_field.dart';

class TreinoForm extends StatefulWidget {
  const TreinoForm({super.key});

  @override
  State<TreinoForm> createState() => _TreinoFormState();
}

class _TreinoFormState extends State<TreinoForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _controllerFields = [
    'nome',
    'exercicios',
    'setsPorExercicio',
  ];
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    for (String field in _controllerFields) {
      _controllers[field] = TextEditingController();
    }
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in _controllers.values) {
      controller.dispose();
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adicionar treino")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 20,
            children: [
              DefaultFormField(label: "Nome do treino", controller: _controllers['nome']),
              DefaultFormField(label: "Quantidade de exercícios", controller: _controllers['exercicios'], isNumber: true),
              DefaultFormField(label: "Sets por exercício", controller: _controllers['setsPorExercicio'], isNumber: true),
              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancelar"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      
                    },
                    child: Text("Confirmar"),
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
