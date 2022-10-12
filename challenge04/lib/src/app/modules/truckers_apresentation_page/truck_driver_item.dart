import 'package:challenge04/src/app/model/truck_driver.dart';
import 'package:flutter/material.dart';

class TruckDriverItem extends StatelessWidget {
  final TruckDriver motorista;

  const TruckDriverItem({Key? key, required this.motorista}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 30,
        backgroundColor: Colors.purple,
        child: Icon(
          Icons.person,
          size: 25,
          color: Colors.white,
        ),
      ),
      title: Text(
        '${motorista.nome}',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Idade: ${motorista.idade}'),
          Text('Cep: ${motorista.cep}'),
          Text('Sexo: ${motorista.sexo == "M" ? "Masculino" : "Feminino"}'),
          Text('Empresa Atual: ${motorista.empresaAtual}'),
          Text('Veículo: ${motorista.veiculo}')
        ],
      )
    );
  }

}
