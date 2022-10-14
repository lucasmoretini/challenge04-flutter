import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager {

  Future<Database> getDatabase() async {
    final path = join(await getDatabasesPath(), 'truck_driver1.db');
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute(_truckDriver);
    await db.insert('truck_driver', {
      'nome': 'Lucas',
      'idade': 21,
      'sexo': 'masculino',
      'cep': '01315000',
      'veiculo': 'Scania 201',
      'empresaAtual': 'Cometa'
    });
    await db.insert('truck_driver', {
      'nome': 'Jose',
      'idade': 30,
      'sexo': 'masculino',
      'cep': '01315000',
      'veiculo': 'Scania 1001',
      'empresaAtual': 'Latam'
    });
    await db.insert('truck_driver', {
      'nome': 'Joana',
      'idade': 52,
      'sexo': 'feminino',
      'cep': '01315000',
      'veiculo': 'Scania 4001',
      'empresaAtual': 'Vigor'
    });
  }

  String get _truckDriver => '''
    CREATE TABLE IF NOT EXISTS truck_driver (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        idade INTEGER,
        sexo TEXT,
        cep TEXT,
        veiculo TEXT,
        empresaAtual TEXT
      );
  ''';
}