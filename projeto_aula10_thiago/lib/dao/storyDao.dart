import 'package:projeto_aula10_thiago/database/database_helper.dart';
import 'package:projeto_aula10_thiago/models/story.dart';
import 'package:sqflite/sqflite.dart';

class StoryDao {
  StoryDao._();
  static final StoryDao instance = StoryDao._();


  Future<List<Story>> getStories() async {
    Database db = await DatabaseHelper.instance.database;
    var stories = await db.query('stories', orderBy: 'id DESC');
    List<Story> storyList = stories.isNotEmpty
        ? stories.map((item) => Story.fromMap(item)).toList()
        : [];
    return storyList;
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