import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';

/// Obtiene el tamaño para la letra del texto de información
double _getTextInformationSize(BuildContext context) {
  return MediaQuery.sizeOf(context).height * 0.022;
}

/// Obtiene el tamaño para la letra de los botones
double _getTextButtonsSize(BuildContext context) {
  return MediaQuery.sizeOf(context).height * 0.019;
}

/// Estilo general del texto de los botones
TextStyle _textBtnStyle(double textBtnSize) {
  return TextStyle(
      fontFamily: 'NotoSans',
      color: AppColors.seventh,
      fontSize: textBtnSize,
      fontWeight: FontWeight.w700);
}

/// Estilo general del texto de información
TextStyle _textInformationStyle(double textInfoSize) {
  return TextStyle(
      fontFamily: 'NotoSans',
      fontSize: textInfoSize,
      fontWeight: FontWeight.w400);
}

//! Modal Informarción
Future<void> showInformationModal(BuildContext context, String text) async {
  final textInfoSize = _getTextInformationSize(context);
  final textBtnSize = _getTextButtonsSize(context);
  AwesomeDialog(
    context: context,
    dismissOnTouchOutside: false,
    animType: AnimType.scale,
    dialogType: DialogType.info,
    body: Center(
      child: Text(
        text,
        style: _textInformationStyle(textInfoSize),
      ),
    ),
    buttonsTextStyle: _textBtnStyle(textBtnSize),
    btnOkOnPress: () {},
  ).show();
}

//! Modal Advetencia
Future<void> showWarningModal(BuildContext context, String text,
    Function()? btnOkOnPress, Function()? btnCancelOnPress) async {
  final textInfoSize = _getTextInformationSize(context);
  final textBtnSize = _getTextButtonsSize(context);
  AwesomeDialog(
          context: context,
          dismissOnTouchOutside: false,
          animType: AnimType.scale,
          dialogType: DialogType.warning,
          body: Center(
            child: Text(
              text,
              style: _textInformationStyle(textInfoSize),
            ),
          ),
          buttonsTextStyle: _textBtnStyle(textBtnSize),
          btnOkOnPress: btnOkOnPress,
          btnCancelOnPress: btnCancelOnPress)
      .show();
}

//! Modal Error
Future<void> showErrorModal(BuildContext context, String text,
    Function()? btnOkOnPress, Function()? btnCancelOnPress) async {
  final textInfoSize = _getTextInformationSize(context);
  final textBtnSize = _getTextButtonsSize(context);
  AwesomeDialog(
          context: context,
          dismissOnTouchOutside: false,
          animType: AnimType.scale,
          dialogType: DialogType.error,
          body: Center(
            child: Text(
              text,
              style: _textInformationStyle(textInfoSize),
            ),
          ),
          buttonsTextStyle: _textBtnStyle(textBtnSize),
          btnOkOnPress: btnOkOnPress,
          btnCancelOnPress: btnCancelOnPress)
      .show();
}

//! Modal Bien
Future<void> showGoodModal(BuildContext context, String text,
    Function()? btnOkOnPress, Function()? btnCancelOnPress) async {
  final textInfoSize = _getTextInformationSize(context);
  final textBtnSize = _getTextButtonsSize(context);
  AwesomeDialog(
          context: context,
          dismissOnTouchOutside: false,
          animType: AnimType.scale,
          dialogType: DialogType.success,
          body: Center(
            child: Text(
              text,
              style: _textInformationStyle(textInfoSize),
            ),
          ),
          buttonsTextStyle: _textBtnStyle(textBtnSize),
          btnOkOnPress: btnOkOnPress,
          btnCancelOnPress: btnCancelOnPress)
      .show();
}

//! Modal de carga
Future<void> showLoadingModal(BuildContext context) async {
  final size = MediaQuery.sizeOf(context).height * 0.08;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        child: SizedBox.expand(
          child: Container(
            color: AppColors.first.withOpacity(0.4),
            child: SpinKitChasingDots(
              color: AppColors.twelfth,
              size: size,
            ),
          ),
        ),
      );
    },
  );
}

//! Cerrar Modal
Future<void> closeModal(BuildContext context) async {
  GoRouter.of(context).pop();
}
