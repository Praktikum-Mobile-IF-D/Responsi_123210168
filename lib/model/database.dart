import 'package:sqflite/sqflite.dart';

class BookmarkDB {
  late Database _database;

  BookmarkDB._(this._database);

  static Future<BookmarkDB> open() async {
    Database database = await openDatabase(
      'bookmark_database.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE bookmarks(id INTEGER PRIMARY KEY, jobId INTEGER)',
        );
      },
    );
    return BookmarkDB._(database);
  }

  Future<void> saveBookmark(int jobId) async {
    await _database.insert(
      'bookmarks',
      {'jobId': jobId},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<int>> getBookmarkedJobs() async {
    final List<Map<String, dynamic>> maps = await _database.query('bookmarks');
    return List.generate(maps.length, (i) => maps[i]['jobId'] as int);
  }

  Future<void> close() async {
    await _database.close();
  }
}
