import 'package:gabriel_11_05/database/database_helper.dart';
import 'package:gabriel_11_05/models/comment.dart';
import 'package:sqflite/sqlite_api.dart';

class CommentDao {
  static Future<List<Comment>> all() async {
    Database db = await DatabaseHelper.instance.database;
    var comments = await db.query('comments', orderBy: 'id DESC');
    return comments.isNotEmpty
        ? comments.map((item) => Comment.fromMap(item)).toList()
        : [];
  }

  static Future<Comment> find(int id) async {
    Database db = await DatabaseHelper.instance.database;
    var comments = await db.query(
      'comments',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    return Comment.fromMap(comments.first);
  }

  static Future<int> add(Comment newComment) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.insert('comments', newComment.toMap());
  }

  static Future<int> remove(Comment comment) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.delete(
      'comments',
      where: 'id = ?',
      whereArgs: [comment.id],
    );
  }

  static Future<int> update(Comment comment) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.update(
      'comments',
      comment.toMap(),
      where: 'id = ?',
      whereArgs: [comment.id],
    );
  }

  static Future<List<Comment>> getCommentsByPost(int postId) async {
    Database db = await DatabaseHelper.instance.database;
    var comments = await db.query(
      'comments',
      orderBy: 'id DESC',
      where: 'post_id = ?',
      whereArgs: [postId],
    );
    return comments.isNotEmpty
        ? comments.map((item) => Comment.fromMap(item)).toList()
        : [];
  }
}
