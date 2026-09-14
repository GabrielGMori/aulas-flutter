class Comment {
  int? id;
  String text;
  int postId;

  Comment({this.id, required this.text, required this.postId});

  factory Comment.fromMap(Map<String, dynamic> json) =>
      Comment(id: json['id'], text: json['text'], postId: json['post_id']);

  Map<String, dynamic> toMap() => {'id': id, 'text': text, 'post_id': postId};
}
