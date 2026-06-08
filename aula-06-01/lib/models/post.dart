class Post {
  Post({required this.title, required this.text});

  String title;
  String text;
  bool liked = false;

  void like() {
    liked = !liked;
  }
}
