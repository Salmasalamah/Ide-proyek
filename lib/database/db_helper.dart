import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'booking.db');

    return await openDatabase(
      path,
      version: 2, // Naikkan versi ke 2 agar tabel ter-reset otomatis
      onCreate: (db, version) async {
        await _createTable(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < newVersion) {
          await db.execute("DROP TABLE IF EXISTS booking");
          await _createTable(db);
        }
      },
    );
  }

  static Future<void> _createTable(Database db) async {
    await db.execute('''
      CREATE TABLE booking (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        field TEXT,
        package TEXT,
        date TEXT,
        time TEXT,
        duration INTEGER,
        price INTEGER
      )
    ''');
  }

  // ================= INSERT =================
  static Future<int> insertBooking(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert('booking', data);
  }

  // ================= GET ALL =================
  static Future<List<Map<String, dynamic>>> getBookings() async {
    final db = await database;
    return await db.query('booking', orderBy: 'id DESC');
  }

  // ================= UPDATE =================
  // Saya samakan parameternya dengan yang dikirim dari EditBookingScreen
  static Future<int> updateBooking(
    int id,
    String name,
    String package,
    int duration,
    int price,
  ) async {
    final db = await database;
    return await db.update(
      'booking',
      {
        'name': name,
        'package': package,
        'duration': duration,
        'price': price,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // ================= DELETE =================
  static Future<int> deleteBooking(int id) async {
    final db = await database;
    return await db.delete('booking', where: 'id = ?', whereArgs: [id]);
  }

  // ================= TOTAL PEMASUKAN =================
  static Future<int> getTotalIncome() async {
    final db = await database;
    final result = await db.rawQuery('SELECT SUM(price) as total FROM booking');
    return result.first['total'] == null ? 0 : result.first['total'] as int;
  }
}