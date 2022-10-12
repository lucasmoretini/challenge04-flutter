import 'package:challenge04/src/app/model/truck_driver.dart';
import 'package:challenge04/src/app/modules/truckers_apresentation_page/truck_driver_item.dart';
import 'package:challenge04/src/repository/truck_driver_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../recomendation_page/recomendation_page.dart';

class TruckDriverApresentation extends StatefulWidget {
  const TruckDriverApresentation({Key? key}) : super(key: key);

  @override
  State<TruckDriverApresentation> createState() =>
      _TruckDriverApresentationState();
}

class _TruckDriverApresentationState extends State<TruckDriverApresentation> {
  var _futureMotoristas = TruckDriverRepository().listarCaminhoneiros();

  navigateToRecomendationPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => RecomendationPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Motoristas'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: navigateToRecomendationPage
        )
      ),
      body: FutureBuilder<List<TruckDriver>>(
        future: _futureMotoristas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            final motoristas = snapshot.data ?? [];
            return ListView.separated(
              itemCount: motoristas.length,
              itemBuilder: (context, index) {
                final motorista = motoristas[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) async {
                          await TruckDriverRepository().removerCaminhoneiro(motorista.id);
                          setState(() {
                            _futureMotoristas =
                                TruckDriverRepository().listarCaminhoneiros();
                          });
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Remover',
                      )
                    ],
                  ),
                  child: TruckDriverItem(motorista: motorista),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          }
          return Container();
        },
      )
    );
  }
}
