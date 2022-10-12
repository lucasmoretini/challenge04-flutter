import 'dart:ffi';

import 'package:challenge04/src/app/model/truck_driver.dart';
import 'package:sqflite/sqflite.dart';

import '../app/database/database_manager.dart';

class TruckDriverRepository {
  Future<List<TruckDriver>> listarCaminhoneiros() async {
    Database db = await DatabaseManager.instance.database;
    List rows = await db.rawQuery('''
          SELECT 
            *
          FROM truck_driver
    ''');
    return rows
        .map(
          (row) => TruckDriver(
              id: row['id'] as int,
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
    Database db = await DatabaseManager.instance.database;
    return db.insert('truck_driver', {
      'idade': truckDriver.idade,
      'sexo': truckDriver.sexo,
      'cep': truckDriver.cep,
      'veiculo': truckDriver.veiculo,
      'empresaAtual': truckDriver.empresaAtual
    });
  }

  Future<void> removerCaminhoneiro(int? id) async {
    Database db = await DatabaseManager.instance.database;
    await db.delete('truck_driver', where: 'id = ?', whereArgs: [id]);
  }

  //editar caminhoneiro]
}
