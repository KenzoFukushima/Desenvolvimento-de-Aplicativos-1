class  Post  {
  int? id;
  String title;


  Post({
    this.id,
    required this.title,
  });

  factory Post.fromMap(Map<String, dynamic> json) => Post(
    id: json['id'],
    title: json['title'],
  );

  Map<String, dynamic> toMap() => {
    'id' : id,
    'title' : title,
};

}


