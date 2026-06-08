class  Post  {
  String title;
  String text;
  bool liked;

  Post({
    required this.title,
    required this.text,
    this.liked = false,
  });

  void like () {
    this.liked = !this.liked;
  }
}


