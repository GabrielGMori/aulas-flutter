import 'package:gabriel_11_05/database/database_helper.dart';
import 'package:gabriel_11_05/models/story.dart';
import 'package:sqflite/sqlite_api.dart';

class StoryDao {
  StoryDao._();
  static final StoryDao instance = StoryDao._();

  Future<List<Story>> getStories() async {
    Database db = await DatabaseHelper.instance.database;
    var stories = await db.query('stories', orderBy: 'id DESC');
    return stories.isNotEmpty
        ? stories.map((item) => Story.fromMap(item)).toList()
        : [];
  }

  Future<int> add(Story newStory) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.insert('stories', newStory.toMap());
  }

  Future<int> remove(Story story) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.delete('stories', where: 'id = ?', whereArgs: [story.id]);
  }

  Future<int> update(Story story) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.update('stories', story.toMap(), where: 'id = ?', whereArgs: [story.id]);
  }
}
