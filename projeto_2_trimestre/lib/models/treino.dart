
class Treino {
  int? id;
  String nome;
  String grupoMuscular;
  int series;
  int repeticao;
  double carga;
  bool favorito;


  Treino({
    this.id,
    required this.nome,
    required this.grupoMuscular,
    required this.series,
    required this.repeticao,
    required this.carga,
    this.favorito = false,
  });

  void like () {
    favorito = !favorito;
  }

  factory Treino.fromMap(Map<String, dynamic> json) => Treino(
    id: json['id'],
    nome: json['nome'],
    grupoMuscular: json['grupoMuscular'],
    series: json['series'],
    repeticao: json['repeticao'],
    carga: json['carga'],
    favorito: json['favorito'] == 0 ? false : true
  );

  Map<String, dynamic> toMap() => {
    'id' : id,
    'nome' : nome,
    'grupoMuscular' : grupoMuscular,
    'series' : series,
    'repeticao' : repeticao,
    'carga' : carga,
    'favorito' : favorito ? 1: 0,
};
}
