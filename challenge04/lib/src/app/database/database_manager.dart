import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager {
  DatabaseManager._();
  static final DatabaseManager instance = DatabaseManager._();
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  Future<Database> getDatabase() async {
    final path = join(await getDatabasesPath(), 'truck_driver.db');
    return openDatabase(path, version: 1);
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'truck_driver.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, int versao) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS veiculos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        idade INTEGER,
        sexo TEXT,
        cep TEXT,
        veiculo TEXT,
        empresaAtual TEXT,
      );
    ''');
  }
}