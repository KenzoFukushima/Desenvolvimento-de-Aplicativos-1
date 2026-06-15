class Story {
  String title;
  bool view;


  Story ({
    required this.title,
    this.view = false,
  });

  void viewed () {
    this.view = !this.view;
  }
}