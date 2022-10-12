import 'package:challenge04/src/app/model/truck_driver.dart';
import 'package:challenge04/src/repository/truck_driver_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:masked_text/masked_text.dart';
import 'package:select_form_field/select_form_field.dart';

import '../../components/button_component.dart';
import '../../components/title_component.dart';
import '../recomendation_page/recomendation_page.dart';

class TruckDriverRegistration extends StatefulWidget {
  const TruckDriverRegistration({
    Key? key,
  }) : super(key: key);

  @override
  _TruckDriverRegistrationState createState() =>
      _TruckDriverRegistrationState();
}

class _TruckDriverRegistrationState extends State<TruckDriverRegistration> {
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TruckDriverRepository repository = TruckDriverRepository();

  navigateToRecomendationPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => RecomendationPage(),
      ),
    );
  }

  String? _nome;
  int? _idade;
  String? _note;
  String? _sexo;
  String? _cep;
  String? _veiculo;
  String? _empresa;

  final List<Map<String, dynamic>> sexos = [
    {
      'value': 'M',
      'label': 'Masculino',
      'icon': Icon(Icons.man),
    },
    {
      'value': 'F',
      'label': 'Feminino',
      'icon': Icon(Icons.woman),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scania'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: navigateToRecomendationPage,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TitlePattern(titleText: 'Qual o perfil do seu caminhoneiro?'),
              TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Qual o nome do seu caminhoneiro?',
                    labelText: 'Nome',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Digite o nome do motorista';
                    }
                    return null;
                  },
                  onSaved: (value) => _nome = value!),
              TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Qual o veículo do seu caminhoneiro?',
                    labelText: 'Veículo',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Digite o veículo';
                    }
                    return null;
                  },
                  onSaved: (value) => _veiculo = value!),
              TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Qual empresa o caminhoneiro trabalha?',
                      labelText: 'Empresa'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Digite a empresa';
                    }
                    return null;
                  },
                  onSaved: (value) => _empresa = value!),
              TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Qual a idade?', labelText: 'Idade'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Digite a idade';
                    }
                    if (int.parse(value) < 18) {
                      return 'A idade deve ser maior que 18 anos';
                    }
                    return null;
                  },
                  onSaved: (value) => _idade = int.parse(value!)),
              SelectFormField(
                hintText: 'Qual o seu sexo?',
                labelText: 'Sexo',
                items: sexos,
                onSaved: (value) => _sexo = value!,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Digite o sexo';
                  }
                  return null;
                },
              ),
              MaskedTextField(
                mask: "#####-###",
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'Qual o seu cep?', labelText: 'Cep'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Digite o cep';
                  }
                  if (value.length != 9) {
                    return 'Digite o cep corretamente, ex: 01234-567';
                  }
                  return null;
                },
                onSaved: (value) => _cep = value!,
              ),
              const SizedBox(
                height: 80,
              ),
              ButtonPattern(
                onPressed: () {
                  final form = formKey.currentState;
                  if (form!.validate()) {
                    form.save();
                    TruckDriver driver = TruckDriver(
                      nome: _nome!,
                      idade: _idade!,
                      sexo: _sexo!,
                      cep: _cep!,
                      veiculo: _veiculo!,
                      empresaAtual: _empresa!);
                    repository.cadastrarCaminhoneiro(driver);
                    navigateToRecomendationPage();
                  }
                },
                buttonText: 'Cadastrar')
            ],
          ),
        ),
      ),
    );
  }
}
