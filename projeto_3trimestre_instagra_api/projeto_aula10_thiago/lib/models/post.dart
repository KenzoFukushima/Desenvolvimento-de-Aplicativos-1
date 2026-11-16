class  Post  {
  int? id;
  String title;
  String text;
  bool liked;

  Post({
    this.id,
    required this.title,
    required this.text,
    this.liked = false,
  });

  void like () {
    liked = !liked;
  }

  // Converte o JSON recebido da API em um objeto Post
  factory Post.fromMap(Map<String, dynamic> json) => Post(
    id: json['id'],
    title: json['title'],
    text: json['text'],
    liked: json['liked'] ?? false,
  );
  // Converte o objeto Post no JSON enviado para a API
  Map<String, dynamic> toMap() => {
    'title': title,
    'text': text,
    'liked': liked,
  };

}


