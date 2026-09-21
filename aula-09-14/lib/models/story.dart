import 'package:flutter/material.dart';

class Story {
  int? id;
  String text;
  Color color;
  bool blocked;

  Story({this.id, required this.text, required this.color, this.blocked = false});

  factory Story.fromMap(Map<String, dynamic> json) => Story(
    id: json['id'],
    text: json['text'],
    color: Color(int.parse(json['color'], radix: 16)),
    blocked: json['blocked'] == 0 ? false : true,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'text': text,
    'color': color.toARGB32().toRadixString(16).toUpperCase(),
    'blocked': blocked ? 1 : 0,
  };

  void block() {
    blocked = !blocked; 
  }
}
