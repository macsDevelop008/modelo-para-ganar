// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modelo_para_ganar/configuration/configuration.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future logOut(BuildContext context) async {
  showWarningModal(context, '¿Deseas cerrar sesión?', () {
    _confirmLogOut(context);
  }, () {});
}

Future _confirmLogOut(BuildContext context) async {
  // Modal Loading
  showLoadingModal(context);

  // Instancia shared preferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // Delay UX
  await Future.delayed(const Duration(seconds: 1));

  // Eliminar identificación del usuario almacenada
  prefs.setString(EnvironmentVariables.userIdentification, '');

  // Cerrar modal cargando
  closeModal(context);

  // Redireccionar al LogIn
  context.go('/${LogInScreen.name}');
}
