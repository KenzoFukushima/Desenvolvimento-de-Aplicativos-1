class Story {
  int? id;
  String title;
  bool view;


  Story ({
    this.id,
    required this.title,
    this.view = false,
  });

  void viewed () {
    view = !view;
  }

  factory Story.fromMap(Map<String, dynamic> json) => Story(
    id: json['id'],
    title: json['title'],
    view: json['view'] == 0 ? false : true,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'view': view ? 1 : 0,
  };

}