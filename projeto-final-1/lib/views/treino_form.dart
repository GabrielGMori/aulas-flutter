import 'package:flutter/material.dart';
import 'package:gabrel_projeto_flutter/database/treino_dao.dart';
import 'package:gabrel_projeto_flutter/models/treino.dart';
import 'package:gabrel_projeto_flutter/views/components/default_form_field.dart';

class TreinoForm extends StatefulWidget {
  const TreinoForm({super.key, this.treino});

  final Treino? treino;

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

    _controllers['nome']!.text = widget.treino?.nome ?? '';
    _controllers['exercicios']!.text =
        widget.treino?.exercicios.toString() ?? '';
    _controllers['setsPorExercicio']!.text =
        widget.treino?.setsPorExercicio.toString() ?? '';
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
              DefaultFormField(
                label: "Nome do treino",
                controller: _controllers['nome'],
              ),
              DefaultFormField(
                label: "Quantidade de exercícios",
                controller: _controllers['exercicios'],
                isNumber: true,
              ),
              DefaultFormField(
                label: "Sets por exercício",
                controller: _controllers['setsPorExercicio'],
                isNumber: true,
              ),
              if (widget.treino != null)
                CheckboxListTile(
                  value: widget.treino!.realizado,
                  title: Text("Realizado"),
                  onChanged: (value) {
                    setState(() {
                      widget.treino!.toggleRealizado();
                    });
                  },
                ),
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

                      String nome = _controllers['nome']!.value.text;
                      int exercicios = int.parse(
                        _controllers['exercicios']!.value.text,
                      );
                      int setsPorExercicio = int.parse(
                        _controllers['setsPorExercicio']!.value.text,
                      );

                      if (widget.treino == null) {
                        await TreinoDao.instance.add(
                          Treino(
                            nome: nome,
                            exercicios: exercicios,
                            setsPorExercicio: setsPorExercicio,
                          ),
                        );
                      } else {
                        widget.treino!.nome = nome;
                        widget.treino!.exercicios = exercicios;
                        widget.treino!.setsPorExercicio = setsPorExercicio;
                        await TreinoDao.instance.update(widget.treino!);
                      }

                      if (!context.mounted) {
                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Treino salvo!"),
                          duration: Durations.extralong4,
                        ),
                      );

                      Navigator.pop(context);
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
