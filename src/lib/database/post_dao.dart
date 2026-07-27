import 'package:gabriel_11_05/database/database_helper.dart';
import 'package:gabriel_11_05/models/post.dart';
import 'package:sqflite/sqlite_api.dart';

class PostDao {
  PostDao._();
  static final PostDao instance = PostDao._();

  Future<List<Post>> getPosts() async {
    Database db = await DatabaseHelper.instance.database;
    var posts = await db.query('posts', orderBy: 'id DESC');
    return posts.isNotEmpty
        ? posts.map((item) => Post.fromMap(item)).toList()
        : [];
  }

  Future<int> add(Post newPost) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.insert('posts', newPost.toMap());
  }

  Future<int> remove(Post post) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.delete('posts', where: 'id = ?', whereArgs: [post.id]);
  }

  Future<int> update(Post post) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.update('posts', post.toMap(), where: 'id = ?', whereArgs: [post.id]);
  }
}
