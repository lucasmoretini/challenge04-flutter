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
import '../truckers_apresentation_page/truck_driver_apresentation_page.dart';

class TruckDriverRegistration extends StatefulWidget {
  TruckDriver? motoristaParaEdicao;
  TruckDriverRegistration({ Key? key, this.motoristaParaEdicao}) : super(key: key);

  @override
  State<TruckDriverRegistration> createState() => _TruckDriverRegistrationState();
}

class _TruckDriverRegistrationState extends State<TruckDriverRegistration> {
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TruckDriverRepository repository = TruckDriverRepository();

  final _nomeController = TextEditingController();
  final _idadeController = TextEditingController();
  final _sexoController = TextEditingController();
  final _cepController = TextEditingController();
  final _veiculoController = TextEditingController();
  final _empresaController = TextEditingController();

  navigateToApresentationPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const TruckDriverApresentation(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    final motorista = widget.motoristaParaEdicao;
    if (motorista != null) {
      _nomeController.text = motorista.nome;
      _idadeController.text = motorista.idade.toString();
      _sexoController.text  = motorista.sexo;
      _cepController.text  = motorista.cep;
      _veiculoController.text  = motorista.veiculo;
      _empresaController.text  = motorista.empresaAtual;
    }

    carregarMotoristas();
  }

  Future<void> carregarMotoristas() async {
    final categorias = await repository.listarCaminhoneiros();

    setState(() {
      categorias.toList();
    });
  }

  String? _nome;
  int? _idade;
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
          onPressed: navigateToApresentationPage,
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
                  controller: _nomeController,
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
                  controller: _veiculoController,
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
                  controller: _empresaController,
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
                  controller: _idadeController,
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
                controller: _sexoController,
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
                controller: _cepController,
                mask: "#####-###",
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'Qual o seu cep?', labelText: 'Cep'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Digite o cep';
                  }
                  if (value.replaceAll("-", " ").length != 9) {
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
                onPressed: () async {
                  final isValid = formKey.currentState!.validate();
                  if (isValid) {

                    TruckDriver truckdriver = TruckDriver(
                      nome: _nomeController.text,
                      idade: int.parse(_idadeController.text),
                      sexo: _sexoController.text,
                      cep: _cepController.text,
                      veiculo: _veiculoController.text,
                      empresaAtual: _empresaController.text
                    );

                    var isUpdate = true;
                    try {
                      if (widget.motoristaParaEdicao != null) {
                        truckdriver.id = widget.motoristaParaEdicao!.id;
                        await repository.editarCaminhoneiro(truckdriver);
                      } else {
                        isUpdate = false;
                        await repository.cadastrarCaminhoneiro(truckdriver);
                      }
                    
                      var message = isUpdate ? 
                                    'funcionário atualizado com sucesso' :
                                    "funcionário cadastrado com sucesso";
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(message),
                      ));

                    Navigator.of(context).pop(true);
                    }catch (e) {
                      Navigator.of(context).pop(false);
                    }
                  }
                },
                buttonText: 'Salvar')
            ],
          ),
        ),
      ),
    );
  }
}
