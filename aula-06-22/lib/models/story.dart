import 'package:flutter/material.dart';

class Story {
  Story({required this.text, required this.color});

  final String text;
  final Color color;
  bool blocked = false;

  void block() {
    blocked = !blocked; 
  }
}
