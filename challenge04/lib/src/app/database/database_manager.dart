import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager {

  Future<Database> getDatabase() async {
    final path = join(await getDatabasesPath(), 'truck_driver.db');
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute(_truckDriver);
  }

  String get _truckDriver => '''
    CREATE TABLE IF NOT EXISTS truck_driver (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        idade INTEGER,
        sexo TEXT,
        cep TEXT,
        veiculo TEXT,
        empresaAtual TEXT,
      );
  ''';
}