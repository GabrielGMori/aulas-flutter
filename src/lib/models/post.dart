class Post {
  int? id;
  String title;
  String text;
  bool liked;

  Post({this.id, required this.title, required this.text, this.liked = false});

  factory Post.fromMap(Map<String, dynamic> json) => Post(
    id: json['id'],
    title: json['title'],
    text: json['text'],
    liked: json['liked'] == 0 ? false : true,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'text': text,
    'liked': liked ? 1 : 0,
  };
  
  void like() {
    liked = !liked;
  }
}
