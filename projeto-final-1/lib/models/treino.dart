
class Treino {
  int? id;
  String nome;
  int exercicios;
  int setsPorExercicio;
  bool realizado;

  Treino({this.id, required this.nome, required this.exercicios, required this.setsPorExercicio, this.realizado = false});

  factory Treino.fromMap(Map<String, dynamic> json) => Treino(
    id: json['id'],
    nome: json['nome'],
    exercicios: json['exercicios'],
    setsPorExercicio: json['setsPorExercicio'],
    realizado: json['realizado'] == 0 ? false : true,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'nome': nome,
    'exercicios': exercicios,
    'setsPorExercicio': setsPorExercicio,
    'realizado': realizado ? 1 : 0
  };
  
  void toggleRealizado() {
    realizado = !realizado;
  }
}
