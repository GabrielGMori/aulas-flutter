import 'package:flutter/material.dart';

// Crie uma tela que deve pedir o nome do usuário, como ele está se sentindo no
// momento e mostrar uma saudação (Text) e uma imagem. Vamos utilizar um form
// para realizar a validação das caixas de texto (TextFormField). Ou seja, só devem ser
// apresentadas a mensagem de saudação e a imagem caso as caixas de texto sejam
// preenchidas.

class Ex02Subview extends StatelessWidget {
  const Ex02Subview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(20), child: Saudacao());
  }
}

class Saudacao extends StatefulWidget {
  const Saudacao({super.key});

  @override
  State<Saudacao> createState() => _SaudacaoState();
}

class _SaudacaoState extends State<Saudacao> {
  final Map<String, String> _formFields = {
    'nomeUsuario': 'Nome de usuário',
    'sentimento': 'Como você está se sentindo?',
  };
  final Map<String, TextEditingController> _controllers = {};
  final _formKey = GlobalKey<FormState>();

  bool showingSaudacao = false;

  @override
  void initState() {
    super.initState();
    for (String formFieldKey in _formFields.keys) {
      _controllers[formFieldKey] = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: showingSaudacao == false
          ? Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20,
                children: [
                  for (MapEntry formField in _formFields.entries)
                    TextFormField(
                      controller: _controllers[formField.key],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: formField.value,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor, preencha esse campo";
                        }
                        return null;
                      },
                    ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          showingSaudacao = true;
                        });
                      }
                    },
                    child: Text('Prosseguir'),
                  ),
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Olá, ${_controllers['nomeUsuario']!.text}! Você está se sentindo ${_controllers['sentimento']!.text}, né? Aqui está uma imagem:',
                  textAlign: TextAlign.center,
                ),
                Image.asset('assets/image/tijolo.png'),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showingSaudacao = false;
                    });
                  },
                  child: Text('Voltar'),
                ),
              ],
            ),
    );
  }
}
