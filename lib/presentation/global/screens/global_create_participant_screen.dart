// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/domain/domain.dart';
import 'package:modelo_para_ganar/infrastructure/infrastructure.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

class GlobalCReateParticipantScreen extends StatefulWidget {
  const GlobalCReateParticipantScreen({super.key});

  @override
  State<GlobalCReateParticipantScreen> createState() =>
      _GlobalCReateParticipantScreenState();
}

class _GlobalCReateParticipantScreenState
    extends State<GlobalCReateParticipantScreen> {
  // Listado de datos requerido para el registro, ya con controller
  List<FormFieldParticipantEntityController> listFormFieldsResult = [];
  // Listado de datos requerido para el registro, sin controller
  List<FormFieldParticipantEntity> listFormFieldsBasic = [];

  //! Crear los objetos de los espacios requeridos para el registro, toma
  //! solo los obligatorios
  Future<void> _castFormFieldEntity() async {
    List<FormFieldParticipantEntityController> result = [];

    //Delay UX
    await Future.delayed(const Duration(seconds: 1));
    // Obtener listado de la api
    final datasource = HttpServiceDioDatasourceImpl();
    final repository = HttpServiceRepositoryImpl(datasource: datasource);
    final listFormFields = await repository.singupFormFields();

    // Error durante la peticion
    if (!listFormFields.$1 || listFormFields.$2 == null) {
      //if (true) {
      throw ('Error al obtener la información.');
    } else {
      listFormFieldsBasic = listFormFields.$2!;
      for (var element in listFormFields.$2!) {
        if (element.isRequired) {
          // Si alguno de los campos obigatorios es diferente a String o Numérico
          if (element.typeValue == 'String' ||
              element.typeValue == 'Integer' ||
              element.typeValue == 'Numeric' ||
              element.typeValue == 'Double') {
            result.add(FormFieldParticipantEntityController(data: element));
          }
          // Si no, en esta version no soporta otro tipo de dato para crear widget
          else {
            throw ('En esta versión de la app, solo soporta FormFields String y Numeric.');
          }
        }
      }
      listFormFieldsResult = result;
    }
  }

  Row _buttons(BuildContext context, double widthRoundedSquare) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //! Boton cancelar
        ElevatedButton(
            onPressed: () {
              _cancelEvent();
            },
            child: Text(
              'Cancelar',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w700,
                  color: AppColors.third,
                  fontSize: widthRoundedSquare * 0.07),
            )),
        //! Boton crear
        ElevatedButton(
            onPressed: () async {
              _createParticipant();
            },
            child: Text(
              'Crear',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w700,
                  color: AppColors.third,
                  fontSize: widthRoundedSquare * 0.07),
            )),
      ],
    );
  }

  //! Evento para crear participante
  Future<void> _createParticipant() async {
    // Verificar si hay datos sin ingresar
    bool isVoidText = false;
    for (int i = 0; i < listFormFieldsResult.length && !isVoidText; i++) {
      if (listFormFieldsResult[i].controller.text == '') {
        isVoidText = true;
        break;
      }
    }
    if (isVoidText) {
      // Mostrar modal, llenar todos los campos
      showWarningModal(
          context, 'Ingresa todos los campos para continuar.', () {}, null);
    }
    // Modal Confirmar la creación
    else {
      showWarningModal(context, '¿Estás seguro de crear el participante?', () {
        _confirmCreateParticipant();
      }, () {});
    }
  }

  Future<void> _confirmCreateParticipant() async {
    // Mostrar modal de carga
    showLoadingModal(context);

    // Delay UX
    await Future.delayed(const Duration(seconds: 1));

    // Listado de los datos ya con informacion

    final data = listFormFieldsResult.map((element) {
      return FormFieldParticipantEntity(
          typeValue: element.data.typeValue,
          name: element.data.name,
          isRequired: element.data.isRequired,
          label: element.data.label,
          value: element.controller.text);
    }).toList();

    // Consumir petición
    final datasource = HttpServiceDioDatasourceImpl();
    final repository = HttpServiceRepositoryImpl(datasource: datasource);
    final result = await repository.createParticipant(data);

    // Si no es falso o el código vacio
    if (result.$1 && result.$2 != '') {
      // Si el código es 21, el email o Número del cliente ya está registrado
      if (result.$2 == '21') {
        // Cerrar modal de carga
        closeModal(context);
        showWarningModal(
            context,
            'El número de cliente o email ingresado ya se encuentra(n) registrado(s). O email inválido.',
            () {},
            null);
      }
      // Registro exitoso
      else if (result.$2 == '200') {
        // Cerrar modal de carga
        closeModal(context);
        // Abrir modal success
        showGoodModal(context, '¡Registro de participante exitoso!', () {
          // Cerrar modal Crear Participante
          closeModal(context);
        }, null);
      }
      // Error inesperado
      else {
        // Cerrar modal de carga
        closeModal(context);
        // Abrir modal error inesperado
        showWarningModal(
            context,
            'Ha ocurrido un error inesperado, vuelve a intentarlo.',
            () {},
            null);
      }
    } else {
      // Cerrar modal de carga
      closeModal(context);
      // Modal de error en la solicitud
      showErrorModal(context,
          'Ocurrió un error en la solicitud, vuelve a intentar.', () {}, null);
    }
  }

  //! Evento para cancelar la creación del participante
  void _cancelEvent() {
    // Verificar si no hay datos
    bool allIsVoid = true;
    for (int i = 0; i < listFormFieldsResult.length && allIsVoid; i++) {
      if (listFormFieldsResult[i].controller.text != '') {
        allIsVoid = false;
        break;
      }
    }
    if (allIsVoid) {
      // Cerrar modal sin confirmar
      closeModal(context);
    } else {
      _confirmCancel();
    }
  }

  void _confirmCancel() {
    showWarningModal(context, '¿Deseas cancelar la creación?', () {
      // Cerrar modal
      closeModal(context);
    }, () {});
  }

  @override
  Widget build(BuildContext context) {
    final heightRoundedSquare = ResponsiveDimentions.height(context, 0.6);
    final widthRoundedSquare = ResponsiveDimentions.width(context, 0.7);

    final inputsHeight = heightRoundedSquare * 0.15;
    final inputsWidth = widthRoundedSquare * 0.8;

    return Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(heightRoundedSquare * 0.03),
        width: widthRoundedSquare,
        height: heightRoundedSquare,
        decoration: BoxDecoration(
            // Color
            color: AppColors.sixth,
            // Bordes redondeados
            borderRadius:
                BorderRadius.all(Radius.circular(widthRoundedSquare * 0.07)),
            border: Border.all(color: AppColors.tenth.withOpacity(0.6))),
        child: FutureBuilder(
          future: _castFormFieldEntity(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Platform.isIOS
                    ? CupertinoActivityIndicator(
                        color: AppColors.seventh,
                      )
                    : CircularProgressIndicator(
                        color: AppColors.seventh,
                      ),
              );
            }
            // Si se generó un error durante a carga de información
            else if (snapshot.hasError) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      '${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'NotoSans',
                          color: AppColors.seventh,
                          fontSize: heightRoundedSquare * 0.07),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          closeModal(context);
                        },
                        child: Text(
                          'Cancelar',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontWeight: FontWeight.w700,
                              color: AppColors.third,
                              fontSize: widthRoundedSquare * 0.07),
                        )),
                  ],
                ),
              );
            }
            // Si cargó la info sin problemas
            else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //! Titulo
                  Text(
                    'Crear Participante',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: heightRoundedSquare * 0.05,
                        fontWeight: FontWeight.w700,
                        color: AppColors.seventh),
                  ),
                  const Divider(),
                  //! Inputs datos ingresar
                  Container(
                    width: double.infinity,
                    height: heightRoundedSquare * 0.65,
                    color: Colors.red.withOpacity(0),
                    child: ListView.builder(
                      itemCount: listFormFieldsResult.length,
                      itemBuilder: (BuildContext context, int index) {
                        return LogInTitleInputTextWidget(
                          width: inputsWidth,
                          height: inputsHeight,
                          hintText:
                              '${listFormFieldsResult[index].data.label}*',
                          controller: listFormFieldsResult[index].controller,
                          title: listFormFieldsResult[index].data.label,
                          obscureText: false,
                        );
                      },
                    ),
                  ),
                  //! Linea divisora
                  const Divider(),
                  //! Botones
                  _buttons(context, widthRoundedSquare)
                ],
              );
            }
          },
        ));
  }
}

// Objeto baso en la entidad pero con Controlador del TextField
class FormFieldParticipantEntityController {
  FormFieldParticipantEntityController({required this.data}) {
    controller = TextEditingController();
  }

  late TextEditingController controller;
  FormFieldParticipantEntity data;
}
