
import 'package:challenge04/src/app/database/database_manager.dart';
import 'package:challenge04/src/app/model/truck_driver.dart';
import 'package:sqflite/sqflite.dart';


class TruckDriverRepository {
  Future<List<TruckDriver>> listarCaminhoneiros() async {
    Database db = await DatabaseManager().getDatabase();
    List rows = await db.rawQuery('''
          SELECT 
            *
          FROM truck_driver
    ''');
    return rows
        .map(
          (row) => TruckDriver(
              id: row['id'] as int,
              nome: row['nome'],
              idade: int.parse(row['idade'].toString()),
              sexo: row['sexo'],
              cep: row['cep'],
              veiculo: row['veiculo'],
              empresaAtual: row['empresaAtual']
        ),
        )
        .toList();
  }

  Future<int> cadastrarCaminhoneiro(TruckDriver truckDriver) async {
    Database db = await DatabaseManager().getDatabase();
    return db.insert('truck_driver', {
      'nome': truckDriver.nome,
      'idade': truckDriver.idade,
      'sexo': truckDriver.sexo,
      'cep': truckDriver.cep,
      'veiculo': truckDriver.veiculo,
      'empresaAtual': truckDriver.empresaAtual
    });
  }

  Future<void> removerCaminhoneiro(int? id) async {
    Database db = await DatabaseManager().getDatabase();
    await db.delete('truck_driver', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> editarCaminhoneiro(TruckDriver truckDriver) async {
    Database db = await DatabaseManager().getDatabase();
    return db.update(
        'truck_driver',
        {
          "id": truckDriver.id,
          'nome': truckDriver.nome,
          'idade': truckDriver.idade,
          'sexo': truckDriver.sexo,
          'cep': truckDriver.cep,
          'veiculo': truckDriver.veiculo,
          'empresaAtual': truckDriver.empresaAtual
        },
        where: 'id = ?',
        whereArgs: [truckDriver.id]);
  }
}
